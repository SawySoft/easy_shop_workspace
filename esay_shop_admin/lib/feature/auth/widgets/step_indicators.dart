import 'package:flutter/material.dart';

import '../../../app/theming/app_colors.dart';

class StepIndicators extends StatelessWidget {
  final Color step1Color, step2Color, step3Color;

  const StepIndicators({
    this.step1Color =  AppColors.grey,
    this.step2Color = AppColors.grey,
    this.step3Color = AppColors.grey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 4,
            decoration: BoxDecoration(color: step1Color, borderRadius: BorderRadius.circular(2)),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            height: 4,
            decoration: BoxDecoration(color: step2Color, borderRadius: BorderRadius.circular(2)),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            height: 4,
            decoration: BoxDecoration(color: step3Color, borderRadius: BorderRadius.circular(2)),
          ),
        ),
      ],
    );
  }
}
