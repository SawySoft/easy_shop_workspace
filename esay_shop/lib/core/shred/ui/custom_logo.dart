import 'package:esay_shop/app/theming/app_colors.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/image_constants.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: AppColors.greyBorder,
        boxShadow: [
          BoxShadow(
            color: AppColors.greyBorder,
            blurRadius: 10,
            spreadRadius: 20,
          ),
        ],
      ),
      child: Center(
          child: Image.asset(
            ImageConstants.logo,
            fit: BoxFit.fill,
          ),
        ),
    );
  }
}