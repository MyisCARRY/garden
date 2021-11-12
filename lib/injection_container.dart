import 'package:flutter/material.dart';
import 'package:garden/core/database/app_database.dart';
import 'package:garden/features/plants/injection_container.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class InjectionContainer extends Injector with PlantInjector {}

abstract class Injector {
  @mustCallSuper
  Future<void> init() async {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    sl.registerSingleton<AppDatabase>(database);
  }
}
