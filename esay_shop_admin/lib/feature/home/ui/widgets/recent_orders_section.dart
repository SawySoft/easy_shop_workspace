import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop_admin/app/router/app_routes.dart';
import 'package:esay_shop_admin/app/theming/app_colors.dart';
import 'package:esay_shop_admin/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../order/models/order_model.dart';

class RecentOrdersSection extends StatelessWidget {
  final List<OrderModel> orders;

  const RecentOrdersSection({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final displayedOrders = orders.take(2).toList();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('recent_orders_title'.tr(), style: textTheme.titleMedium),
            InkWell(
              onTap: () => Navigator.of(context).pushNamed(AppRoutes.orders.route),
              child: Text('see_all_orders'.tr(), style: textTheme.labelLarge!.copyWith(color: AppColors.orange)),
            ),
          ],
        ),
        12.vGap,
        if (orders.isEmpty)
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('no_orders_found'.tr(), style: const TextStyle(color: AppColors.grey)),
            ),
          )
        else
          ...displayedOrders.map(
                (order) {
              final String statusLower = order.status?.toLowerCase() ?? 'pending';
              return InkWell(
                onTap: () => Navigator.pushNamed(context, AppRoutes.orderDetails.route, arguments: order.code),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(color: AppColors.black.withValues(alpha: 0.02), blurRadius: 8, offset: const Offset(0, 2)),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.orange.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.shopping_bag, color: AppColors.orange, size: 18),
                          ),
                          12.hGap,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(order.code ?? '', style: textTheme.titleMedium),
                              2.vGap,
                              Text(order.client?.name ?? '', style: textTheme.headlineMedium),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.paleOrangeBg,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              '• ${statusLower.tr()}',
                              style: textTheme.labelMedium!.copyWith(color: AppColors.orange),
                            ),
                          ),
                          4.vGap,
                          Text('${order.totalPrice ?? ''}', style: textTheme.titleMedium!.copyWith(color: AppColors.orange)),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}