import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop/app/theming/app_colors.dart';
import 'package:esay_shop/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../data/models/checkout_arguments_model.dart';

class OrderSummarySection extends StatelessWidget {
  final CheckoutArgumentsModel args;

  const OrderSummarySection({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final int totalItemsCount = args.cartItems.length;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'order_summary'.tr(),
            style: theme.textTheme.titleMedium,
          ),
          12.vGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'items_count_label'.tr(namedArgs: {'count': totalItemsCount.toString()}),
                style: theme.textTheme.headlineMedium,
              ),
              Text(
                'currency_egp'.tr(namedArgs: {'price': args.totalPrice.toString()}),
                style: theme.textTheme.labelLarge,
              ),
            ],
          ),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'total_label'.tr(),
                style: theme.textTheme.titleLarge,
              ),
              Text(
                'currency_egp'.tr(namedArgs: {'price': args.totalPrice.toString()}),
                style: theme.textTheme.titleLarge!.copyWith(color: AppColors.orange),
              ),
            ],
          ),
        ],
      ),
    );
  }
}