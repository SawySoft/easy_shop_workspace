import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop/app/theming/app_colors.dart';
import 'package:esay_shop/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/checkout_cubit.dart';

class PaymentMethodSection extends StatelessWidget {
  const PaymentMethodSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      buildWhen: (previous, current) => current.maybeWhen(
        paymentMethodChanged: (_) => true,
        orElse: () => false,
      ),
      builder: (context, state) {
        final cubit = context.read<CheckoutCubit>();
        final isCash = cubit.selectedPaymentMethod == "cash";

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
                'payment_method_title'.tr(),
                style: theme.textTheme.titleMedium,
              ),
              12.vGap,
              InkWell(
                onTap: () => cubit.changePaymentMethod("cash"),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isCash ? AppColors.orange : AppColors.grey,
                      width: isCash ? 1.5 : 1.0,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.money, color: AppColors.green),
                      12.hGap,
                      Expanded(
                        child: Text(
                          'cash_on_delivery'.tr(),
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      Radio<String>(
                        value: "cash",
                        groupValue: cubit.selectedPaymentMethod,
                        activeColor: AppColors.orange,
                        onChanged: (val) {
                          if (val != null) cubit.changePaymentMethod(val);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              8.vGap,
              InkWell(
                onTap: () => cubit.changePaymentMethod("card"),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: !isCash ? AppColors.orange : AppColors.grey,
                      width: !isCash ? 1.5 : 1.0,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.credit_card, color: AppColors.blue),
                      12.hGap,
                      Expanded(
                        child: Text(
                          'credit_card_method'.tr(),
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      Radio<String>(
                        value: "card",
                        groupValue: cubit.selectedPaymentMethod,
                        activeColor: AppColors.orange,
                        onChanged: (val) {
                          if (val != null) cubit.changePaymentMethod(val);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}