import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop_admin/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../app/theming/app_colors.dart';

class DocumentRow extends StatelessWidget {
  final String label;
  final bool isUploaded;

  const DocumentRow({super.key, required this.label, required this.isUploaded});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            label,
            style: theme.textTheme.headlineSmall,
          ),
          const Spacer(),
          Icon(
            isUploaded ? Icons.check : Icons.close,
            size: 16,
            color: isUploaded ? AppColors.green : AppColors.grey,
          ),
          4.hGap,
          Text(
            isUploaded ? 'document_row_uploaded'.tr() : 'document_row_not_uploaded'.tr(),
            style: theme.textTheme.labelLarge?.copyWith(
              color: isUploaded ? AppColors.green : AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}