import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hint,
    this.prefixIcon,
    this.validator,
    this.controller,
    this.maxLines,
    this.minLines, this.suffixIcon,
  });

  final String? hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(hintText: hint,
      suffixIcon: suffixIcon
      ),
      minLines: minLines,
      maxLines: maxLines ,
      
    );
  }
}
