import 'package:any_animated_button/any_animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garden/core/error/failures.dart';
import 'package:garden/core/helper/date_formats.dart';
import 'package:garden/core/helper/extensions.dart';
import 'package:garden/core/helper/validators.dart';
import 'package:garden/core/navigator/navigator.dart';
import 'package:garden/core/presentation/widgets/appbars/title_app_bar.dart';
import 'package:garden/core/presentation/widgets/buttons/filled_button.dart';
import 'package:garden/core/presentation/widgets/notifications.dart';
import 'package:garden/core/presentation/widgets/textfields/basic_outlined_textfield.dart';
import 'package:garden/core/style/paddings.dart';
import 'package:garden/core/usecase/usecase.dart';
import 'package:garden/features/plants/domain/entities/plant.dart';
import 'package:garden/features/plants/presentation/blocs/add_plant_bloc/add_plant_bloc.dart';
import 'package:garden/features/plants/presentation/blocs/edit_plant_bloc/edit_plant_bloc.dart';
import 'package:garden/features/plants/presentation/blocs/plant_form_bloc/plant_form_bloc.dart';
import 'package:garden/features/plants/presentation/blocs/plant_form_bloc/plant_form_event.dart';
import 'package:garden/features/plants/presentation/blocs/plant_form_bloc/plant_form_state.dart';
import 'package:garden/features/plants/presentation/blocs/plant_types_bloc/plant_types_bloc.dart';
import 'package:garden/features/plants/presentation/blocs/plant_types_bloc/plant_types_event.dart';
import 'package:garden/features/plants/presentation/widgets/data_button.dart';
import 'package:garden/features/plants/presentation/widgets/plant_type_picker.dart';
import 'package:garden/generated/l10n.dart';
import 'package:garden/injection_container.dart';

class PlantFormScreen extends StatefulWidget with NavigatedScreen {
  const PlantFormScreen({
    required this.onSave,
    this.plant,
    Key? key,
  }) : super(key: key);

  final Plant? plant;
  final VoidCallback onSave;

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
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.plant?.name);
    _plantFormBloc = sl(param1: widget.plant);
    _plantTypesBloc = sl();
    _plantTypesBloc.add(const PlantTypesEvent.load());
    _addPlantBloc = sl();
    _editPlantBloc = sl();
    _formKey = GlobalKey<FormState>();

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
    return MultiBlocListener(
      listeners: [
        AnyAnimatedButtonBlocListener<Plant, NoParams, Failure>(
          bloc: _addPlantBloc,
          onSuccessEnd: (_) => widget.onSave(),
          onErrorStart: (failure) => Notifications.error(failure: failure),
        ),
        AnyAnimatedButtonBlocListener<Plant, NoParams, Failure>(
          bloc: _editPlantBloc,
          onSuccessEnd: (_) => widget.onSave(),
          onErrorStart: (failure) => Notifications.error(failure: failure),
        ),
      ],
      child: Scaffold(
        appBar: TitleAppBar(
          context,
          title: widget.isEdit ? S.current.editPlant.capitalize : S.current.addPlant.capitalize,
        ),
        body: SafeArea(
          child: BlocBuilder(
            bloc: _plantFormBloc,
            builder: (BuildContext context, PlantFormState state) {
              return state.when(
                data: (plant, valid) => Padding(
                  padding: Paddings.horizontal24,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 32.0),
                        BasicOutlinedTextfield(
                          controller: _nameController,
                          autocorrect: false,
                          onChanged: (value) {
                            _plantFormBloc.add(PlantFormEvent.changeName(value));
                          },
                          hint: S.current.name.capitalize,
                          validator: PlantNameValidator.errorMessage,
                        ),
                        const SizedBox(height: 16.0),
                        DataButton(
                          description: '${S.current.plantingDate}: '.capitalize,
                          value: DateFormats.fullDate(plant.plantingDate),
                          onTap: showCalendar,
                        ),
                        const SizedBox(height: 16.0),
                        PlantTypePicker(
                          plantType: plant.type,
                          onPicked: (type) => _plantFormBloc.add(PlantFormEvent.changeType(type.name)),
                        ),
                        const Expanded(child: SizedBox(height: 32.0)),
                        FilledButton(
                          bloc: widget.isEdit ? _editPlantBloc : _addPlantBloc,
                          text: S.current.save.capitalize,
                          enabled: valid,
                          onTap: () => onButtonTap(plant),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void showCalendar() {
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
  }

  void onButtonTap(Plant plant) {
    if (_formKey.currentState?.validate() ?? false) {
      if (widget.isEdit) {
        _editPlantBloc.add(TriggerAnyAnimatedButtonEvent(plant));
      } else {
        _addPlantBloc.add(TriggerAnyAnimatedButtonEvent(plant));
      }
    }
  }
}
