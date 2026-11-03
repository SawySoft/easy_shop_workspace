import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/router/app_routes.dart';
import '../../../../../app/theming/app_colors.dart';
import '../../../../../core/utils/extensions/num_extensions.dart';
import '../../../data/models/checkout_arguments_model.dart';
import '../../../logic/checkout_cubit.dart';
import '../delivery_address_section.dart';
import '../order_items_section.dart';
import '../order_summary_section.dart';
import '../payment_method_section.dart';

class DesktopCheckoutScreen extends StatelessWidget {
  final CheckoutArgumentsModel args;

  const DesktopCheckoutScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (response) {
            Navigator.pushNamed(
              context,
              AppRoutes.successOrder.route,
              arguments: response.code,
            );
          },
          failure: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message), backgroundColor: AppColors.red),
            );
          },
        );
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(title: Text('checkout_title'.tr()), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 7,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const DeliveryAddressSection(),
                    20.vGap,
                    OrderItemsSection(args: args),
                    20.vGap,
                    const PaymentMethodSection(),
                    24.vGap,
                  ],
                ),
              ),
              40.hGap,
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.orange.withValues(alpha: 0.3)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('order_overview'.tr(), style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 22)),
                      20.vGap,
                      OrderSummarySection(args: args),
                      28.vGap,
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.orange,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          ),
                          onPressed: () {
                            final cubit = context.read<CheckoutCubit>();

                            if (cubit.currentAddress.trim().isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('val_address_required'.tr()),
                                  backgroundColor: AppColors.red,
                                ),
                              );
                              return;
                            }
                            cubit.createOrder(
                              cartItems: args.cartItems,
                              address: cubit.currentAddress,
                              latitude: cubit.currentLatitude,
                              longitude: cubit.currentLongitude,
                              paymentMethod: cubit.selectedPaymentMethod,
                            );
                          },
                          child: Text(
                            'place_order'.tr(),
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.white),
                          ),
                        ),
                      ),
                    ],
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