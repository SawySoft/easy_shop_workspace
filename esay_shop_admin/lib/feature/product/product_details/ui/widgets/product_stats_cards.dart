import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop_admin/app/theming/app_colors.dart';
import 'package:esay_shop_admin/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

class ProductStatsCards extends StatelessWidget {
  final String price;
  final String inStock;
  final bool isVisible;

  const ProductStatsCards({super.key, required this.price, required this.inStock, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(color: theme.primaryColor, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(price, style: theme.textTheme.displayLarge!.copyWith(color: AppColors.orange)),
                Text('product_stats_price_label'.tr(), style: const TextStyle(color: AppColors.grey)),
              ],
            ),
          ),
          _buildDivider(),
          Expanded(
            child: Column(
              children: [
                Text(inStock, style: theme.textTheme.displayLarge),
                Text('product_stats_stock_label'.tr(), style: const TextStyle(color: AppColors.grey)),
              ],
            ),
          ),
          _buildDivider(),
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: isVisible ? AppColors.mintGreen : AppColors.redLight,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: isVisible ? AppColors.green : AppColors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        isVisible ? 'product_visible'.tr() : 'product_hidden'.tr(),
                        style: TextStyle(
                          color: isVisible ? AppColors.green : AppColors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                6.vGap,
                Text('product_stats_visibility_label'.tr(), style: const TextStyle(color: AppColors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(height: 36, width: 1, color: AppColors.grey);
  }
}