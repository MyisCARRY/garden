import 'package:flutter/material.dart';
import 'package:garden/core/helper/extensions.dart';
import 'package:garden/core/style/paddings.dart';
import 'package:garden/core/style/text_styles.dart';
import 'package:garden/generated/l10n.dart';

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: Paddings.horizontal24,
            child: Text(S.current.emptyPlants.capitalize, style: roboto.w500.s18.blackColor),
          ),
        ],
      ),
    );
  }
}
