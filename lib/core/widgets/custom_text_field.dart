import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.label,
    this.hint,
    this.prefix,
    this.suffix,
    this.validatior,
    required this.controller,
    this.maxLines,
    this.readOnly = false,
    this.ontap,
  });

  final String? label;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLines;
  final bool readOnly;
  final Function()? ontap;
  final TextEditingController controller;
  final String? Function(String?)? validatior;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validatior,
      controller: controller,
      maxLines: maxLines,
      readOnly: readOnly,
      onTap: ontap,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefix,
        suffixIcon: suffix,
      ),
    );
  }
}
