import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garden/core/helper/extensions.dart';
import 'package:garden/core/helper/images.dart';
import 'package:garden/core/helper/widget_ext.dart';
import 'package:garden/core/style/border_radiuses.dart';
import 'package:garden/core/style/colors.dart';
import 'package:garden/core/style/paddings.dart';
import 'package:garden/core/style/text_styles.dart';

class BasicOutlinedTextfield extends StatefulWidget {
  const BasicOutlinedTextfield({
    required this.controller,
    required this.hint,
    this.inputFormatters,
    this.keyboardType,
    this.prefix,
    this.textInputAction,
    this.autofillHints,
    this.validator,
    this.onChanged,
    this.autocorrect = true,
    this.obscure = false,
    this.showObscureSwitch = false,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final bool autocorrect;
  final bool obscure;
  final bool showObscureSwitch;

  @override
  State<StatefulWidget> createState() => _BasicOutlinedTextfieldState();
}

class _BasicOutlinedTextfieldState extends State<BasicOutlinedTextfield> {
  late bool _obscure;

  @override
  void initState() {
    _obscure = widget.obscure;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 46.0,
          decoration: const BoxDecoration(color: CustomColors.veryLightGreen, borderRadius: BorderRadiuses.all16),
        ),
        TextFormField(
          controller: widget.controller,
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          autofillHints: widget.autofillHints,
          validator: widget.validator,
          onChanged: widget.onChanged,
          autocorrect: widget.autocorrect,
          obscureText: _obscure,
          style: roboto.s16.w500.blackColor,
          decoration: InputDecoration(
            hintText: widget.hint,
            border: InputBorder.none,
            prefix: widget.prefix,
            suffix: widget.showObscureSwitch ? const SizedBox(width: 40.0) : null,
            contentPadding: Paddings.vertical14.overrideZeros(Paddings.horizontal20),
          ),
        ),
        if (widget.showObscureSwitch)
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: Paddings.horizontal20.overrideZeros(const EdgeInsets.only(top: 20.0)),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _obscure = !_obscure;
                  });
                },
                child: SvgPicture.asset(
                  SvgIcons.eye,
                  color: CustomColors.black,
                  height: 18.0,
                ),
              ).noSplash(),
            ),
          ),
      ],
    );
  }
}
