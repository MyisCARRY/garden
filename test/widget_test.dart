// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:garden/core/database/app_database.dart';
import 'package:garden/core/helper/consts.dart';
import 'package:garden/features/plants/data/datasources/local_plant_datasource.dart';
import 'package:garden/features/plants/data/models/plant_entity.dart';
import 'package:garden/features/plants/domain/entities/plant.dart';
import 'package:garden/features/plants/domain/entities/plant_type_enum.dart';

void main() {
  group('database tests', () {
    late AppDatabase database;
    late LocalPlantDatasource datasource;

    setUp(() async {
      database = await $FloorAppDatabase.inMemoryDatabaseBuilder().build();
      datasource = database.localPlantDatasource;
    });

    tearDown(() async {
      await database.close();
    });

    test('insert plant', () async {
      final plant = Plant(
        name: 'Cactus',
        type: PlantTypeEnum.ferns,
        plantingDate: DateTime.now(),
      );
      final entity = PlantEntity.fromPlant(plant);
      await datasource.insertPlant(entity);
      final actual = await datasource.getPlantsPage(0, Consts.plantListPageSize);

      expect(actual, hasLength(1));
    });
  });
}
