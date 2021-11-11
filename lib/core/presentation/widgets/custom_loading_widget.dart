import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garden/core/style/colors.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    this.color = CustomColors.black,
    Key? key,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
