import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garden/core/style/border_radiuses.dart';
import 'package:garden/core/style/colors.dart';
import 'package:garden/core/style/paddings.dart';
import 'package:garden/core/style/text_styles.dart';

class SearchTextfield extends StatefulWidget {
  const SearchTextfield({
    required this.controller,
    required this.hint,
    this.inputFormatters,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;

  @override
  State<StatefulWidget> createState() => _SearchTextfieldState();
}

class _SearchTextfieldState extends State<SearchTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: roboto.w500.s18.blackColor,
      decoration: InputDecoration(
        hintText: widget.hint,
        border: const OutlineInputBorder(
          borderRadius: BorderRadiuses.all16,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadiuses.all16,
          borderSide: BorderSide(
            color: CustomColors.darkGreen,
            width: 2.0,
          ),
        ),
        contentPadding: Paddings.horizontal16,
      ),
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChanged,
    );
  }
}
