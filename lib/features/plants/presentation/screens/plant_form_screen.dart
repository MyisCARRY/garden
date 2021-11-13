import 'package:any_animated_button/any_animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garden/core/navigator/navigator.dart';
import 'package:garden/core/presentation/widgets/custom_error_widget.dart';
import 'package:garden/core/presentation/widgets/custom_loading_widget.dart';
import 'package:garden/core/presentation/widgets/overlay_list_picker.dart';
import 'package:garden/features/plants/domain/entities/plant.dart';
import 'package:garden/features/plants/domain/entities/plant_type.dart';
import 'package:garden/features/plants/presentation/blocs/add_plant_bloc/add_plant_bloc.dart';
import 'package:garden/features/plants/presentation/blocs/edit_plant_bloc/edit_plant_bloc.dart';
import 'package:garden/features/plants/presentation/blocs/plant_form_bloc/plant_form_bloc.dart';
import 'package:garden/features/plants/presentation/blocs/plant_form_bloc/plant_form_event.dart';
import 'package:garden/features/plants/presentation/blocs/plant_form_bloc/plant_form_state.dart';
import 'package:garden/features/plants/presentation/blocs/plant_types_bloc/plant_types_bloc.dart';
import 'package:garden/features/plants/presentation/blocs/plant_types_bloc/plant_types_event.dart';
import 'package:garden/features/plants/presentation/blocs/plant_types_bloc/plant_types_state.dart';
import 'package:garden/injection_container.dart';

class PlantFormScreen extends StatefulWidget with NavigatedScreen {
  const PlantFormScreen({
    this.plant,
    Key? key,
  }) : super(key: key);

  final Plant? plant;

  bool get isEdit => plant?.id != null;

  @override
  _PlantFormScreenState createState() => _PlantFormScreenState();

  @override
  String get routeName => 'plant_form';
}

class _PlantFormScreenState extends State<PlantFormScreen> {
  late final TextEditingController _nameController;
  late final PlantFormBloc _plantFormBloc;
  late final PlantTypesBloc _plantTypesBloc;
  late final AddPlantBloc _addPlantBloc;
  late final EditPlantBloc _editPlantBloc;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.plant?.name);
    _plantFormBloc = sl(param1: widget.plant);
    _plantTypesBloc = sl();
    _plantTypesBloc.add(const PlantTypesEvent.load());
    _addPlantBloc = sl();
    _editPlantBloc = sl();

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _plantFormBloc.close();
    _plantTypesBloc.close();
    _addPlantBloc.close();
    _editPlantBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEdit ? 'Edit' : 'Add'),
      ),
      body: SafeArea(
        child: BlocBuilder(
          bloc: _plantFormBloc,
          builder: (BuildContext context, PlantFormState state) {
            return state.when(
              data: (plant, valid) => Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    autocorrect: false,
                    onChanged: (value) {
                      _plantFormBloc.add(PlantFormEvent.changeName(value));
                    },
                  ),
                  InkWell(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      ).then((value) {
                        if (value != null) {
                          _plantFormBloc.add(PlantFormEvent.changeDate(value));
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(plant.plantingDate.toString()),
                    ),
                  ),
                  BlocBuilder(
                    bloc: _plantTypesBloc,
                    builder: (BuildContext context, PlantTypesState state) {
                      return state.when(
                        loading: () => const CustomLoadingWidget(),
                        error: (failure) => CustomErrorWidget(
                          onRefresh: () => _plantTypesBloc.add(const PlantTypesEvent.load()),
                        ),
                        empty: () => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(plant.type),
                        ),
                        data: (data) => OverlayListPicker<PlantType>(
                          values: data,
                          toText: (type) => type.name,
                          onPicked: (type) => _plantFormBloc.add(PlantFormEvent.changeType(type.name)),
                          selected: PlantType(name: plant.type),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(plant.type.isEmpty ? 'Choose type' : plant.type),
                          ),
                        ),
                      );
                    },
                  ),
                  TextButton(
                    onPressed: widget.isEdit
                        ? () => _editPlantBloc.add(TriggerAnyAnimatedButtonEvent(plant))
                        : () => _addPlantBloc.add(TriggerAnyAnimatedButtonEvent(plant)),
                    child: Text(valid ? 'valid' : 'invalid'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
