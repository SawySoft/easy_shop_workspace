import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop_admin/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../app/theming/app_colors.dart';
import '../../../models/order_item_model.dart';

class OrderItemsSection extends StatelessWidget {
  final List<OrderItemModel>? orderItems;

  const OrderItemsSection({super.key, required this.orderItems});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('order_items_section_title'.tr(), style: textTheme.headlineMedium),
          12.vGap,
          if (orderItems == null || orderItems!.isEmpty)
            Text('order_items_no_items'.tr(), style: const TextStyle(color: AppColors.grey))
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: orderItems!.length,
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(color: AppColors.grey),
              ),
              itemBuilder: (context, index) {
                final item = orderItems![index];
                final double itemPrice = item.price?.toDouble() ?? 0;
                final int itemQty = item.quantity ?? 1;
                final double totalPrice = itemPrice * itemQty;

                return Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: (item.productImage != null && item.productImage!.isNotEmpty)
                            ? Image.network(item.productImage!, fit: BoxFit.cover)
                            : const Icon(Icons.shopping_bag_outlined, color: AppColors.grey),
                      ),
                    ),
                    12.hGap,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.productName ?? 'order_items_default_product'.tr(), style: textTheme.titleMedium),
                          4.vGap,
                          Text(
                            'order_item_subtitle_format'.tr(namedArgs: {
                              'category': item.categoryName ?? 'order_items_default_category'.tr(),
                              'price': '$itemPrice',
                              'qty': '$itemQty',
                            }),
                            style: textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'order_item_total_format'.tr(namedArgs: {'total': '$totalPrice'}),
                      style: textTheme.titleLarge,
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