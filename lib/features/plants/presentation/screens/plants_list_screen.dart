import 'package:flutter/material.dart';
import 'package:garden/core/helper/consts.dart';
import 'package:garden/core/helper/extensions.dart';
import 'package:garden/core/presentation/widgets/appbars/title_app_bar.dart';
import 'package:garden/core/presentation/widgets/buttons/filled_button.dart';
import 'package:garden/core/presentation/widgets/custom_empty_screen.dart';
import 'package:garden/core/presentation/widgets/custom_error_widget.dart';
import 'package:garden/core/style/paddings.dart';
import 'package:garden/features/plants/domain/entities/plant.dart';
import 'package:garden/features/plants/domain/usecases/get_all_plants_usecase.dart';
import 'package:garden/features/plants/presentation/screens/plant_form_screen.dart';
import 'package:garden/features/plants/presentation/widgets/plant_widget.dart';
import 'package:garden/generated/l10n.dart';
import 'package:garden/injection_container.dart';
import 'package:pagination_view/bloc/pagination_bloc.dart';
import 'package:pagination_view/pagination_view.dart';

class PlantsListScreen extends StatefulWidget {
  const PlantsListScreen({Key? key}) : super(key: key);

  @override
  _PlantsListScreenState createState() => _PlantsListScreenState();
}

class _PlantsListScreenState extends State<PlantsListScreen> {
  late final PaginationCubit _paginationCubit;

  @override
  void initState() {
    _paginationCubit = PaginationCubit([], _fetch);

    super.initState();
  }

  @override
  void dispose() {
    _paginationCubit.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(
        context,
        title: S.current.garden.capitalize,
        showLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PaginationView<Plant>(
                itemBuilder: (BuildContext context, Plant plant, int i) => Padding(
                  padding: Paddings.horizontal24.overrideZeros(Paddings.vertical8),
                  child: PlantWidget(
                    plant: plant,
                    onTap: () => PlantFormScreen(plant: plant).addScreen(context),
                  ),
                ),
                pageFetch: _fetch,
                onEmpty: const CustomEmptyWidget(),
                onError: (error) => CustomErrorWidget(onRefresh: _paginationCubit.refreshPaginatedList),
              ),
            ),
            const SizedBox(height: 12.0),
            Padding(
              padding: Paddings.horizontal24,
              child: FilledButton(
                text: 'Add plant to garden',
                onTap: () => const PlantFormScreen().addScreen(context),
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Future<List<Plant>> Function(int) get _fetch => (int currentListSize) async {
        final int page = (currentListSize / Consts.plantListPageSize).ceil();

        final result = await sl<GetPlantsPageUsecase>()(page);

        // throwing exceptions triggers onError in PaginationView
        return result.fold(
          (_) => throw Exception(),
          (data) => data,
        );
      };
}
