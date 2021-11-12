import 'package:garden/core/database/app_database.dart';
import 'package:garden/features/plants/data/datasources/local_plant_datasource.dart';
import 'package:garden/features/plants/data/repositories/local_plant_repository.dart';
import 'package:garden/features/plants/domain/repositories/local_plant_repository.dart';
import 'package:garden/features/plants/domain/usecases/get_all_plants_usecase.dart';
import 'package:garden/features/plants/domain/usecases/insert_plant_usecase.dart';
import 'package:garden/injection_container.dart';

mixin PlantInjector on Injector {
  @override
  Future<void> init() async {
    await super.init();

    // blocs

    // use cases
    sl.registerLazySingleton(() => GetPlantsPageUsecase(repository: sl()));
    sl.registerLazySingleton(() => InsertPlantUsecase(repository: sl()));

    // repositories
    sl.registerLazySingleton<LocalPlantRepository>(() => LocalPlantRepositoryImpl(datasource: sl()));

    // data sources
    sl.registerLazySingleton<LocalPlantDatasource>(() => sl<AppDatabase>().localPlantDatasource);
  }
}
