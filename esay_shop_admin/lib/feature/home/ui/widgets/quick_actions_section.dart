import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop_admin/app/router/app_routes.dart';
import 'package:esay_shop_admin/app/theming/app_colors.dart';
import 'package:esay_shop_admin/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'quick_actions_title'.tr(),
          style: textTheme.titleMedium,
        ),
        12.vGap,
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () => Navigator.of(context).pushNamed(AppRoutes.upsertProduct.route),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                  foregroundColor: AppColors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                icon: const Icon(Icons.add, size: 20),
                label: Text(
                  'quick_action_add_product'.tr(),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ),
            12.hGap,
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => Navigator.of(context).pushNamed(AppRoutes.upsertCategory.route),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.orange,
                  side: const BorderSide(color: AppColors.orange, width: 1.5),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.sell_outlined, size: 18),
                label: Text(
                  'quick_action_categories'.tr(),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}