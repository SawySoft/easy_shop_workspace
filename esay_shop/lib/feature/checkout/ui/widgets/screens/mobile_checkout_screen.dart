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

class MobileCheckoutScreen extends StatelessWidget {
  final CheckoutArgumentsModel args;

  const MobileCheckoutScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (response) {
            Navigator.pushNamed(context, AppRoutes.successOrder.route, arguments: response.code);
          },
          failure: (message) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(message), backgroundColor: AppColors.red));
          },
        );
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(title: Text('checkout_title'.tr())),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const DeliveryAddressSection(),
                    16.vGap,
                    OrderItemsSection(args: args),
                    16.vGap,
                    const PaymentMethodSection(),
                    16.vGap,
                    OrderSummarySection(args: args),
                    16.vGap,
                  ],
                ),
              ),
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
              16.vGap,
            ],
          ),
        ),
      ),
    );
  }
}