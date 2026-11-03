import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop/app/theming/app_colors.dart';
import 'package:esay_shop/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

class StockBadge extends StatelessWidget {
  final int unitsLeft;

  const StockBadge({super.key, required this.unitsLeft});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isOutOfStock = unitsLeft <= 0;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: isOutOfStock ? AppColors.redLight : AppColors.mintGreen,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Text(
            isOutOfStock ? 'out_of_stock'.tr() : 'in_stock'.tr(),
            style: theme.textTheme.headlineSmall,
          ),
          4.vGap,
          Text(
            isOutOfStock
                ? 'no_units_left'.tr()
                : 'units_left_plural'.tr(namedArgs: {'count': unitsLeft.toString()}),
            style: theme.textTheme.labelLarge!.copyWith(
              color: isOutOfStock ? AppColors.red : AppColors.green,
            ),
          ),
        ],
      ),
    );
  }
}