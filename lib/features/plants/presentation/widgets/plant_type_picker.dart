import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garden/core/helper/extensions.dart';
import 'package:garden/core/presentation/widgets/custom_error_widget.dart';
import 'package:garden/core/presentation/widgets/custom_loading_widget.dart';
import 'package:garden/core/presentation/widgets/overlay_list_picker.dart';
import 'package:garden/core/style/text_styles.dart';
import 'package:garden/features/plants/domain/entities/plant_type.dart';
import 'package:garden/features/plants/presentation/blocs/plant_types_bloc/plant_types_bloc.dart';
import 'package:garden/features/plants/presentation/blocs/plant_types_bloc/plant_types_event.dart';
import 'package:garden/features/plants/presentation/blocs/plant_types_bloc/plant_types_state.dart';
import 'package:garden/features/plants/presentation/widgets/data_button.dart';
import 'package:garden/generated/l10n.dart';
import 'package:garden/injection_container.dart';

class PlantTypePicker extends StatefulWidget {
  const PlantTypePicker({
    required this.plantType,
    required this.onPicked,
    Key? key,
  }) : super(key: key);

  final String plantType;
  final void Function(PlantType) onPicked;

  @override
  _PlantTypePickerState createState() => _PlantTypePickerState();
}

class _PlantTypePickerState extends State<PlantTypePicker> {
  late final PlantTypesBloc _plantTypesBloc;

  @override
  void initState() {
    _plantTypesBloc = sl();
    _plantTypesBloc.add(const PlantTypesEvent.load());

    super.initState();
  }

  @override
  void dispose() {
    _plantTypesBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _plantTypesBloc,
      builder: (BuildContext context, PlantTypesState state) {
        return state.when(
          loading: () => const CustomLoadingWidget(),
          error: (failure) => CustomErrorWidget(
            onRefresh: () => _plantTypesBloc.add(const PlantTypesEvent.load()),
          ),
          empty: () => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.plantType, style: roboto.s18.w500.blackColor),
          ),
          data: (data) => OverlayListPicker<PlantType>(
            values: data,
            toText: (type) => type.name,
            onPicked: widget.onPicked,
            selected: PlantType(name: widget.plantType),
            child: DataButton(
              description: '${S.current.plantType}: '.capitalize,
              value: widget.plantType,
            ),
          ),
        );
      },
    );
  }
}
