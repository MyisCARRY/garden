import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garden/core/style/colors.dart';
import 'package:garden/core/style/text_styles.dart';

class PlantInfoRow extends StatelessWidget {
  const PlantInfoRow({
    required this.icon,
    required this.description,
    required this.value,
    Key? key,
  }) : super(key: key);

  final String icon;
  final String description;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20.0,
          child: SvgPicture.asset(
            icon,
            height: 18.0,
            color: CustomColors.darkGreen,
          ),
        ),
        const SizedBox(width: 4.0),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: description, style: roboto.w400.s16.lightGreenColor),
              TextSpan(text: value, style: roboto.w500.s16.greenColor),
            ],
          ),
        ),
      ],
    );
  }
}
