// ignore: file_names
import 'package:flutter/material.dart';
import 'package:resturant_app/constants/colors.dart';

class CustomTextfiled extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final InputBorder? border;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String? Function(String?)? validator;

  const CustomTextfiled({
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
        filled: true,
        fillColor: mainColor.withOpacity(0.2),
        border:
            border ??
            const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),

        prefixIcon: prefixIcon,
      ),
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: obscureText ?? false,
      validator: validator,
    );
  }
}
