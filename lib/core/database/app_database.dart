import 'dart:async';
import 'package:floor/floor.dart';
import 'package:garden/features/plants/data/datasources/local_plant_datasource.dart';
import 'package:garden/features/plants/data/models/plant_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [PlantEntity])
abstract class AppDatabase extends FloorDatabase {
  LocalPlantDatasource get localPlantDatasource;
}