import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop/app/router/app_routes.dart';
import 'package:esay_shop/app/theming/app_colors.dart';
import 'package:esay_shop/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

class SuccessOrderScreen extends StatelessWidget {
  final String orderCode;

  const SuccessOrderScreen({
    super.key,
    required this.orderCode,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: AppColors.mintGreen,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle_outline_rounded,
                  color: AppColors.green,
                  size: 64,
                ),
              ),
              32.vGap,
              Text(
                'payment_successful_title'.tr(),
                style: theme.textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
              12.vGap,
              Text(
                'order_placed_subtitle'.tr(),
                style: theme.textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              8.vGap,
              Text(
                'order_code_format'.tr(namedArgs: {'code': orderCode}),
                style: theme.textTheme.titleMedium!.copyWith(color: AppColors.orange),
                textAlign: TextAlign.center,
              ),
              40.vGap,
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).pushNamed(AppRoutes.orders.route),
                  icon: const Icon(
                    Icons.inventory_2_outlined,
                    color: AppColors.white,
                    size: 20,
                  ),
                  label: Text(
                    'view_orders_button'.tr(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.orange,
                    elevation: 4,
                    shadowColor: AppColors.orange.withValues(alpha: 0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              16.vGap,
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pushNamed(AppRoutes.dashboard.route),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.paleOrangeBg,
                    side: const BorderSide(
                      color: AppColors.disabledButton,
                      width: 1,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'continue_shopping_button'.tr(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.orange,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}