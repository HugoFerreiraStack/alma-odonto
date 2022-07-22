// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../config/themes/app_colors.dart';

class InputForm extends StatelessWidget {
  final String? labelText, hintText;
  final TextEditingController? controller;
  final bool? obscureText;
  final Color? color, hintColor;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength, minLines, maxLines;
  final bool showCounter;
  final Function(String)? onChanged;
  const InputForm({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
    this.obscureText,
    this.color,
    this.hintColor,
    this.validator,
    this.inputFormatters,
    this.maxLength,
    this.minLines = 1,
    this.maxLines = 1,
    this.showCounter = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: color ?? Colors.black),
      obscureText: obscureText ?? false,
      obscuringCharacter: '●',
      validator: validator,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      onChanged: onChanged,
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        counter: (showCounter) ? null : const Offstage(),
        fillColor: Colors.white,
        filled: true,
        labelText: labelText,
        hintText: hintText,
        hintStyle: TextStyle(color: hintColor ?? Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: const TextStyle(color: Colors.black54),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.all(8),
        errorStyle: const TextStyle(color: Colors.red),
      ),
    );
  }
}
