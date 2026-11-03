import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop_admin/app/theming/app_colors.dart';
import 'package:esay_shop_admin/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

class OrderSummarySection extends StatelessWidget {
  final num totalPrice;

  const OrderSummarySection({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: theme.primaryColor, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('order_summary_section_title'.tr(), style: textTheme.headlineMedium),
          12.vGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('order_summary_total_label'.tr(), style: textTheme.headlineMedium),
              Text(
                'order_summary_total_format'.tr(namedArgs: {'total': '$totalPrice'}),
                style: textTheme.displayMedium!.copyWith(color: AppColors.orange),
              ),
            ],
          ),
        ],
      ),
    );
  }
}