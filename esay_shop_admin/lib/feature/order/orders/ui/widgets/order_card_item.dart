import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop_admin/app/router/app_routes.dart';
import 'package:esay_shop_admin/app/theming/app_colors.dart';
import 'package:esay_shop_admin/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/extensions/date_time_extension.dart';
import '../../../models/order_model.dart';

class OrderCardItem extends StatelessWidget {
  final OrderModel order;

  const OrderCardItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    final String paymentMethodLower = order.paymentMethod?.toLowerCase() ?? 'card';
    final String statusLower = order.status?.toLowerCase() ?? 'pending';
    final bool isPending = statusLower == 'pending';

    return InkWell(
      onTap: () => Navigator.pushNamed(context, AppRoutes.orderDetails.route, arguments: order.code),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: AppColors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('order_card_code_format'.tr(namedArgs: {'code': order.code ?? ''}), style: textTheme.labelLarge),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: isPending ? AppColors.paleOrangeBg : AppColors.mintGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isPending ? AppColors.orange : AppColors.green,
                        ),
                      ),
                      6.hGap,
                      Text(
                        statusLower.tr(),
                        style: TextStyle(
                          color: isPending ? Colors.orange.shade800 : Colors.green.shade800,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            4.vGap,
            Text(order.client?.name ?? 'customer_guest'.tr(), style: textTheme.headlineMedium),
            12.vGap,
            Row(
              children: [
                const Icon(Icons.calendar_today_outlined, size: 14, color: AppColors.grey),
                4.hGap,
                Text(
                  DateTime.parse(order.date ?? DateTime.now().toString()).orderFormat,
                  style: textTheme.headlineSmall,
                ),
                8.hGap,
                const Icon(Icons.shopping_bag_outlined, size: 14, color: AppColors.grey),
                4.hGap,
                Text(
                  'order_card_items_count_format'.tr(namedArgs: {'count': '${order.orderItems?.length ?? 1}'}),
                  style: textTheme.headlineSmall,
                ),
                12.hGap,
                const Icon(Icons.payment_outlined, size: 14, color: AppColors.grey),
                4.hGap,
                Text(paymentMethodLower.tr(), style: textTheme.headlineSmall),
              ],
            ),
            20.vGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'order_card_price_format'.tr(namedArgs: {'price': '${order.totalPrice ?? 0}'}),
                  style: textTheme.displayMedium!.copyWith(color: AppColors.orange),
                ),
                const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}