import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop/app/theming/app_colors.dart';
import 'package:esay_shop/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/checkout_cubit.dart';

class DeliveryAddressSection extends StatelessWidget {
  const DeliveryAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final checkoutCubit = context.watch<CheckoutCubit>();

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
            'delivery_address_title'.tr(),
            style: theme.textTheme.titleMedium,
          ),
          8.vGap,
          Row(
            children: [
              const Icon(Icons.location_on_outlined, color: AppColors.orange, size: 20),
              8.hGap,
              Expanded(
                child: Text(
                  checkoutCubit.currentAddress,
                  style: theme.textTheme.labelLarge,
                ),
              ),
            ],
          ),
          8.vGap,
          Align(
            alignment: Alignment.center,
            child: TextButton.icon(
              onPressed: () {
                checkoutCubit.updateLocationToCurrent();
              },
              icon: const Icon(Icons.edit_location_outlined, size: 16, color: AppColors.orange),
              label: Text(
                'change_location'.tr(),
                style: const TextStyle(fontSize: 12, color: AppColors.orange, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}