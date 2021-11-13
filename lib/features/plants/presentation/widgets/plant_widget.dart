import 'package:flutter/material.dart';
import 'package:garden/core/helper/date_formats.dart';
import 'package:garden/core/helper/extensions.dart';
import 'package:garden/core/helper/images.dart';
import 'package:garden/core/style/border_radiuses.dart';
import 'package:garden/core/style/colors.dart';
import 'package:garden/core/style/paddings.dart';
import 'package:garden/core/style/text_styles.dart';
import 'package:garden/features/plants/domain/entities/plant.dart';
import 'package:garden/features/plants/presentation/widgets/plant_info_row.dart';
import 'package:garden/generated/l10n.dart';

class PlantWidget extends StatelessWidget {
  const PlantWidget({
    required this.plant,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final Plant plant;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: CustomColors.veryLightGreen,
        borderRadius: BorderRadiuses.all16,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadiuses.all16,
          child: Padding(
            padding: Paddings.vertical14.overrideZeros(const EdgeInsets.only(right: 20.0)),
            child: Row(
              children: [
                Container(
                  width: 90.0,
                  alignment: Alignment.center,
                  child: Text(plant.emblem.toUpperCase(), style: roboto.w900.s36.darkGreenColor),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(plant.name, style: roboto.w900.s24.darkGreenColor),
                    const SizedBox(height: 8.0),
                    PlantInfoRow(
                      icon: SvgIcons.leaf,
                      description: '${S.current.plantType}: ',
                      value: plant.type,
                    ),
                    const SizedBox(height: 6.0),
                    PlantInfoRow(
                      icon: SvgIcons.pot,
                      description: '${S.current.plantedOn}: ',
                      value: _plantDate,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String get _plantDate => DateFormats.fullDate(plant.plantingDate);
}
