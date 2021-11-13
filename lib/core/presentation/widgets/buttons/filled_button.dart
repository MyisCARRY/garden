import 'package:any_animated_button/any_animated_button.dart';
import 'package:flutter/material.dart';
import 'package:garden/core/helper/extensions.dart';
import 'package:garden/core/style/border_radiuses.dart';
import 'package:garden/core/style/colors.dart';
import 'package:garden/core/style/dimens.dart';
import 'package:garden/core/style/paddings.dart';
import 'package:garden/core/style/text_styles.dart';

class FilledButton extends CustomAnyAnimatedButton {
  FilledButton({
    required this.text,
    this.bloc,
    this.width = double.infinity,
    this.height = Dimens.buttonHeight,
    this.color = CustomColors.darkGreen,
    this.progressColor = CustomColors.white,
    this.disabledColor = CustomColors.lightGreen,
    this.splashColor = CustomColors.green,
    this.style,
    this.disabledStyle,
    this.padding,
    this.enabled = true,
    this.onTap,
  });

  @override
  final AnyAnimatedButtonBloc? bloc;
  final double? width;
  final double height;
  final Color color;
  final Color progressColor;
  final Color disabledColor;
  final Color splashColor;
  final TextStyle? style;
  final TextStyle? disabledStyle;
  final EdgeInsets? padding;
  final bool enabled;
  final VoidCallback? onTap;
  final String text;

  @override
  AnyAnimatedButtonParams get defaultParams => AnyAnimatedButtonParams(
        key: key,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: enabled ? color : disabledColor,
          borderRadius: BorderRadiuses.diagonal10And40,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: splashColor,
            highlightColor: Colors.transparent,
            borderRadius: BorderRadiuses.diagonal10And40,
            onTap: enabled ? onTap : null,
            child: Padding(
              padding: padding ?? Paddings.horizontal20.overrideZeros(Paddings.vertical14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: enabled
                        ? (style ?? roboto.s20.w700.whiteColor)
                        : (disabledStyle ?? roboto.s20.w700.whiteColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  @override
  AnyAnimatedButtonParams get progressParams => AnyAnimatedButtonParams.progress(
        progressColor: progressColor,
        backgroundColor: color,
      );
}
