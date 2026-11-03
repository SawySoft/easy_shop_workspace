import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop_admin/app/theming/app_colors.dart';
import 'package:esay_shop_admin/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

class PaymentInfoSection extends StatelessWidget {
  final String paymentMethod;

  const PaymentInfoSection({super.key, required this.paymentMethod});

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
          Text('payment_section_title'.tr(), style: textTheme.headlineMedium),
          12.vGap,
          Row(
            children: [
              const Icon(Icons.payment_outlined, size: 18, color: AppColors.grey),
              8.hGap,
              Text(paymentMethod.tr(), style: textTheme.titleMedium),
            ],
          ),
        ],
      ),
    );
  }
}