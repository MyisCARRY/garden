import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garden/core/helper/images.dart';
import 'package:garden/core/helper/widget_ext.dart';
import 'package:garden/core/style/colors.dart';
import 'package:garden/core/style/text_styles.dart';

class TitleAppBar extends AppBar {
  TitleAppBar(
    BuildContext context, {
    required String title,
    bool showLeading = true,
    List<Widget>? actions,
  }) : super(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            title,
            style: roboto.s22.w900.blackColor,
          ),
          actions: actions,
          leading: showLeading
              ? InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: SvgPicture.asset(
                      SvgIcons.backArrow,
                      color: CustomColors.black,
                    ),
                  ),
                ).noSplash()
              : null,
        );
}
