import 'package:flutter/material.dart';
import 'package:garden/core/helper/extensions.dart';
import 'package:garden/core/helper/widget_ext.dart';
import 'package:garden/core/style/border_radiuses.dart';
import 'package:garden/core/style/colors.dart';
import 'package:garden/core/style/paddings.dart';
import 'package:garden/core/style/text_styles.dart';

class DataButton extends StatelessWidget {
  const DataButton({
    required this.description,
    required this.value,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String description;
  final String value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: CustomColors.veryLightGreen,
        borderRadius: BorderRadiuses.all16,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadiuses.all16,
          onTap: onTap,
          child: Padding(
            padding: Paddings.vertical14.overrideZeros(Paddings.horizontal20),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: description, style: roboto.w400.s16.lightGreenColor),
                  TextSpan(text: value, style: roboto.w500.s16.greenColor),
                ],
              ),
            ),
          ),
        ).noSplash(),
      ),
    );
  }
}
