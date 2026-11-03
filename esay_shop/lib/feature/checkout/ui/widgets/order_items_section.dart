import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop/app/theming/app_colors.dart';
import 'package:esay_shop/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../data/models/checkout_arguments_model.dart';

class OrderItemsSection extends StatelessWidget {
  final CheckoutArgumentsModel args;

  const OrderItemsSection({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
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
            'order_items_title'.tr(),
            style: theme.textTheme.titleMedium,
          ),
          12.vGap,
          ListView.separated(
            itemCount: args.cartItems.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => 12.vGap,
            itemBuilder: (context, index) {
              final cartItem = args.cartItems[index];
              final product = cartItem.product;

              return Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      product.imageUrl,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  12.hGap,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: theme.textTheme.labelLarge,
                        ),
                        4.vGap,
                        Text(
                          'qty_label'.tr(namedArgs: {'quantity': cartItem.quantity.toString()}),
                          style: theme.textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'currency_egp'.tr(namedArgs: {'price': product.price.toString()}),
                    style: theme.textTheme.labelLarge,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}