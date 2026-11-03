import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../app/theming/app_colors.dart';
import '../../data/models/order_model.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final String paymentMethodLower = order.paymentMethod?.toLowerCase() ?? 'cash';
    final String statusLower = order.status?.toLowerCase() ?? 'pending';

    final bool isCardPayment = paymentMethodLower == 'card';
    final bool isPendingPayment = statusLower == 'pending';
    final bool canPayWithCard = isCardPayment && isPendingPayment;

    return InkWell(
      onTap: () {
        if (canPayWithCard) {
          Navigator.of(context).pushNamed(AppRoutes.payment.route, arguments: order.code);
        } else if (isCardPayment) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('order_paid_already'.tr())),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('order_cash_no_online'.tr())),
          );
        }
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.grey),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('#${order.code}', style: textTheme.titleMedium),
                _buildStatusBadge(statusLower),
              ],
            ),
            4.vGap,
            Text(order.date ?? "", style: textTheme.headlineSmall),
            16.vGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'items_count_plural'.tr(namedArgs: {'count': (order.itemsCount ?? 1).toString()}),
                      style: textTheme.headlineSmall,
                    ),
                    8.hGap,
                    Text('•${statusLower.tr()}', style: textTheme.headlineSmall),
                    8.hGap,
                    Row(
                      children: [
                        const Icon(Icons.payments_outlined, size: 16, color: AppColors.grey),
                        4.hGap,
                        Text(paymentMethodLower.tr(), style: textTheme.headlineSmall),
                      ],
                    ),
                  ],
                ),
                Text(
                  'currency_egp'.tr(namedArgs: {'price': (order.totalPrice ?? 0).toString()}),
                  style: textTheme.titleLarge!.copyWith(color: AppColors.orange),
                ),
              ],
            ),
            if (canPayWithCard) ...[
              12.vGap,
              const Divider(height: 1),
              8.vGap,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'tap_to_pay_card'.tr(),
                    style: const TextStyle(fontSize: 12, color: AppColors.orange, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.arrow_forward_ios, size: 12, color: AppColors.orange),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color backgroundColor;
    Color textColor;

    switch (status) {
      case 'processing':
        backgroundColor = AppColors.mintGreen;
        textColor = AppColors.green;
        break;
      case 'cancelled':
        backgroundColor = AppColors.redLight;
        textColor = AppColors.red;
        break;
      case 'pending':
      default:
        backgroundColor = AppColors.amber;
        textColor = AppColors.orange;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(20)),
      child: Text(
        '•${status.tr()}',
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );
  }
}