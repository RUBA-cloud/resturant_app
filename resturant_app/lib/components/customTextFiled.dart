// ignore: file_names
import 'package:flutter/material.dart';

class Customtextfiled extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final InputBorder? border;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String? Function(String?)? validator;

  const Customtextfiled({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.border,
    this.prefixIcon,
    this.keyboardType,
    this.obscureText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border:
            border ??
            OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        prefixIcon: prefixIcon,
      ),
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: obscureText ?? false,
      validator: validator,
    );
  }
}
