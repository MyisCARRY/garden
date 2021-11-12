import 'package:garden/core/database/app_database.dart';
import 'package:garden/features/plants/data/datasources/local_plant_datasource.dart';
import 'package:garden/features/plants/data/repositories/local_plant_repository.dart';
import 'package:garden/features/plants/domain/repositories/local_plant_repository.dart';
import 'package:garden/features/plants/domain/usecases/get_all_plants_usecase.dart';
import 'package:garden/features/plants/domain/usecases/get_plant_types_usecase.dart';
import 'package:garden/features/plants/domain/usecases/insert_plant_usecase.dart';
import 'package:garden/features/plants/presentation/blocs/add_plant_bloc/add_plant_bloc.dart';
import 'package:garden/features/plants/presentation/blocs/plant_form_bloc/plant_form_bloc.dart';
import 'package:garden/features/plants/presentation/blocs/plant_types_bloc/plant_types_bloc.dart';
import 'package:garden/injection_container.dart';

mixin PlantInjector on Injector {
  @override
  Future<void> init() async {
    await super.init();

    // blocs
    sl.registerFactory(() => PlantTypesBloc(getPlantTypesUsecase: sl()));
    sl.registerFactory(() => PlantFormBloc());
    sl.registerFactory(() => AddPlantBloc(insertPlantUsecase: sl()));

    // use cases
    sl.registerLazySingleton(() => GetPlantsPageUsecase(repository: sl()));
    sl.registerLazySingleton(() => InsertPlantUsecase(repository: sl()));
    sl.registerLazySingleton(() => GetPlantTypesUsecase(repository: sl()));

    // repositories
    sl.registerLazySingleton<LocalPlantRepository>(() => LocalPlantRepositoryImpl(datasource: sl()));

    // data sources
    sl.registerLazySingleton<LocalPlantDatasource>(() => sl<AppDatabase>().localPlantDatasource);
  }
}
