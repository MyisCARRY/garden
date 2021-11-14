import 'dart:async';

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
import 'package:garden/core/presentation/widgets/textfields/search_textfield.dart';
import 'package:garden/core/style/paddings.dart';
import 'package:garden/features/plants/domain/entities/plant.dart';
import 'package:garden/features/plants/domain/entities/search_param.dart';
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
  late final TextEditingController _searchController;
  Timer? _debounce;

  @override
  void initState() {
    _pagewiseController = PagewiseLoadController<Plant>(
      pageFuture: _fetch,
      pageSize: Consts.plantListPageSize,
    );
    _searchController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _pagewiseController.dispose();
    _searchController.dispose();
    _debounce?.cancel();

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
            Padding(
              padding: Paddings.horizontal24,
              child: SearchTextfield(
                controller: _searchController,
                hint: S.current.search.capitalize,
                onChanged: (_) => onSearchChanged(),
              ),
            ),
            const SizedBox(height: 22.0),
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
        final param = SearchParam(
          page: page ?? 99999,
          pattern: '%${_searchController.text}%',
        );

        final result = await sl<GetPlantsPageUsecase>()(param);

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

  // added debouncing
  void onSearchChanged() {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    _debounce = Timer(
      const Duration(milliseconds: 500),
      _pagewiseController.reset,
    );
  }
}
