import 'package:flutter/material.dart';

import '../../../app/theming/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final VoidCallback? onTap;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextField(
    this.hintText, {
    super.key,
    this.onTap,
    this.suffixIcon,
    this.validator,
    this.controller,
    this.obscureText = false,
    this.keyboardType = .text,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return TextFormField(

      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: theme.primaryColor,
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.orange, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.red, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.red, width: 2),
        ),
        errorStyle: TextStyle(color: AppColors.red, fontSize: 12, height: 1.5),
        suffixIcon: suffixIcon != null ? IconButton(icon: Icon(suffixIcon,color: AppColors.grey,), onPressed: onTap) : null,
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.grey, fontSize: 14),
        contentPadding: .symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }
}
