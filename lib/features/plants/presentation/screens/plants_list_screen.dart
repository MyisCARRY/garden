import 'package:flutter/material.dart';
import 'package:garden/core/helper/consts.dart';
import 'package:garden/core/presentation/widgets/custom_empty_screen.dart';
import 'package:garden/core/presentation/widgets/custom_error_widget.dart';
import 'package:garden/features/plants/domain/entities/plant.dart';
import 'package:garden/features/plants/domain/usecases/get_all_plants_usecase.dart';
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
      body: SafeArea(
        child: PaginationView<Plant>(
          itemBuilder: (BuildContext context, Plant plant, int i) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Text("$i: $plant"),
          ),
          pageFetch: _fetch,
          onEmpty: const CustomEmptyWidget(),
          onError: (error) => CustomErrorWidget(onRefresh: _paginationCubit.refreshPaginatedList),
        ),
      ),
    );
  }

  Future<List<Plant>> Function(int) get _fetch => (int currentListSize) async {
        final int page = (currentListSize / Consts.plantListPageSize).floor();

        final result = await sl<GetPlantsPageUsecase>()(page);

        // throwing exceptions triggers onError in PaginationView
        return result.fold(
          (_) => throw Exception(),
          (data) => data,
        );
      };
}
