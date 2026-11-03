import 'package:flutter/material.dart';

import '../../../app/theming/app_colors.dart';

class CustomFieldLabel extends StatelessWidget {
  final String label;
  final String hintText;
  const CustomFieldLabel(this.label,{this.hintText = "",super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      children: [
        Text(
          label,
          style: theme.textTheme.labelMedium,
        ),
        Text(
          hintText,
          style:  TextStyle(color: AppColors.grey, fontSize: 14,),
        ),
      ],
    );
  }
}
