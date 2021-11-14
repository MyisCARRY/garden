import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:garden/core/helper/consts.dart';
import 'package:garden/core/helper/extensions.dart';
import 'package:garden/core/presentation/widgets/appbars/title_app_bar.dart';
import 'package:garden/core/presentation/widgets/buttons/filled_button.dart';
import 'package:garden/core/presentation/widgets/custom_empty_screen.dart';
import 'package:garden/core/presentation/widgets/custom_error_widget.dart';
import 'package:garden/core/presentation/widgets/custom_loading_widget.dart';
import 'package:garden/core/presentation/widgets/notifications.dart';
import 'package:garden/core/style/paddings.dart';
import 'package:garden/features/plants/domain/entities/plant.dart';
import 'package:garden/features/plants/domain/usecases/get_all_plants_usecase.dart';
import 'package:garden/features/plants/presentation/screens/plant_form_screen.dart';
import 'package:garden/features/plants/presentation/widgets/plant_widget.dart';
import 'package:garden/generated/l10n.dart';
import 'package:garden/injection_container.dart';

class PlantsListScreen extends StatefulWidget {
  const PlantsListScreen({Key? key}) : super(key: key);

  @override
  _PlantsListScreenState createState() => _PlantsListScreenState();
}

class _PlantsListScreenState extends State<PlantsListScreen> {
  late final PagewiseLoadController<Plant> _pagewiseController;

  @override
  void initState() {
    _pagewiseController = PagewiseLoadController<Plant>(
      pageFuture: _fetch,
      pageSize: Consts.plantListPageSize,
    );

    super.initState();
  }

  @override
  void dispose() {
    _pagewiseController.dispose();

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
              child: PagewiseListView<Plant>(
                itemBuilder: (BuildContext context, Plant plant, int i) => Padding(
                  padding: Paddings.horizontal24.overrideZeros(Paddings.vertical8),
                  child: PlantWidget(
                    plant: plant,
                    onTap: () => PlantFormScreen(
                      plant: plant,
                      onSave: () => onSuccessSave(S.current.successPlantEdit),
                    ).addScreen(context),
                  ),
                ),
                showRetry: false,
                errorBuilder: (_, __) => CustomErrorWidget(onRefresh: _pagewiseController.retry),
                noItemsFoundBuilder: (_) => const CustomEmptyWidget(),
                loadingBuilder: (_) => const CustomLoadingWidget(),
                pageLoadController: _pagewiseController,
              ),
            ),
            const SizedBox(height: 12.0),
            Padding(
              padding: Paddings.horizontal24,
              child: FilledButton(
                text: S.current.addPlantToGarden.capitalize,
                onTap: () => PlantFormScreen(
                  onSave: () => onSuccessSave(S.current.successPlantAdd),
                ).addScreen(context),
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Future<List<Plant>> Function(int?) get _fetch => (int? page) async {
        final result = await sl<GetPlantsPageUsecase>()(page ?? 10000);

        // throwing exceptions triggers onError in PaginationView
        return result.fold(
          (_) => throw Exception(),
          (data) => data,
        );
      };

  void onSuccessSave(String text) {
    Navigator.of(context).maybePop();
    Notifications.neutral(description: text);
    _pagewiseController.reset();
  }
}
