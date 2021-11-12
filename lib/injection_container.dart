import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:garden/core/database/app_database.dart';
import 'package:garden/core/helper/floor_tables.dart';
import 'package:garden/features/plants/injection_container.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class InjectionContainer extends Injector with PlantInjector {}

abstract class Injector {
  @mustCallSuper
  Future<void> init() async {
    // we can also put them into l10n but I don't think it is necessary
    final List<String> _types = [
      "alpines",
      "aquatic",
      "bulbs",
      "succulents",
      "carnivorous",
      "climbers",
      "ferns",
      "grasses",
      "threes",
    ];
    final callback = Callback(
      onCreate: (database, version) {
        _types.map((type) => database.insert(
              FloorTables.plantType,
              {'name': type},
            ));
      },
    );
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').addCallback(callback).build();

    sl.registerSingleton<AppDatabase>(database);
  }
}
