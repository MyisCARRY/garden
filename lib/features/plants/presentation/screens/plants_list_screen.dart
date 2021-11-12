import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garden/core/helper/consts.dart';
import 'package:garden/core/presentation/widgets/custom_empty_screen.dart';
import 'package:garden/core/presentation/widgets/custom_error_widget.dart';
import 'package:garden/core/presentation/widgets/custom_loading_widget.dart';
import 'package:garden/features/plants/domain/entities/plant.dart';
import 'package:garden/features/plants/domain/usecases/get_all_plants_usecase.dart';
import 'package:garden/features/plants/presentation/blocs/plant_types_bloc/plant_types_bloc.dart';
import 'package:garden/features/plants/presentation/blocs/plant_types_bloc/plant_types_event.dart';
import 'package:garden/features/plants/presentation/blocs/plant_types_bloc/plant_types_state.dart';
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
  late final PlantTypesBloc _plantTypesBloc;

  @override
  void initState() {
    _paginationCubit = PaginationCubit([], _fetch);
    _plantTypesBloc = sl();
    _plantTypesBloc.add(const PlantTypesEvent.load());

    super.initState();
  }

  @override
  void dispose() {
    _paginationCubit.close();
    _plantTypesBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder(
              bloc: _plantTypesBloc,
              builder: (BuildContext context, PlantTypesState state) {
                return state.when(
                  loading: () => const CustomLoadingWidget(),
                  error: (failure) => CustomErrorWidget(
                    onRefresh: () => _plantTypesBloc.add(const PlantTypesEvent.load()),
                  ),
                  empty: () => const Text('Empty'),
                  data: (data) => Column(
                    children: data
                        .map((e) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(e.name),
                            ))
                        .toList(),
                  ),
                );
              },
            ),
            Expanded(
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
          ],
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
