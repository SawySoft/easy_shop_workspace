import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop_admin/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../app/theming/app_colors.dart';
import '../../../../../core/utils/extensions/date_time_extension.dart';
import '../../../models/order_model.dart';

class OrderDetailsHeaderCard extends StatelessWidget {
  final OrderModel order;

  const OrderDetailsHeaderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    final String statusLower = order.status?.toLowerCase() ?? 'pending';
    final bool isPending = statusLower == 'pending';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '#${order.code ?? ''}',
                style: textTheme.titleMedium,
              ),
              6.vGap,
              Row(
                children: [
                  const Icon(Icons.calendar_today_outlined, size: 14, color: AppColors.grey),
                  6.hGap,
                  Text(
                    DateTime.parse(order.date ?? DateTime.now().toString()).orderFormat,
                    style: textTheme.headlineMedium,
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                    color: isPending ? AppColors.orange : AppColors.green,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}