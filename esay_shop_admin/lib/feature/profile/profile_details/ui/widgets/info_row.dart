import 'package:esay_shop_admin/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../app/theming/app_colors.dart';

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label, value;

  const InfoRow({super.key, required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.grey),
          8.hGap,
          Text(label,style: theme.textTheme.headlineSmall,),
          const Spacer(),
          Text(value, style: theme.textTheme.labelMedium),
        ],
      ),
    );
  }
}