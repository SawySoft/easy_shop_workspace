import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../app/theming/app_colors.dart';
import '../../../../core/utils/extensions/num_extensions.dart';
import '../../../checkout/data/models/checkout_arguments_model.dart';
import '../../logic/cart_cubit.dart';

class MobileCartScreen extends StatelessWidget {
  const MobileCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final CartCubit cubit = context.read<CartCubit>();

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("shopping_cart_title".tr(), style: theme.textTheme.titleLarge),
                      Text(
                        "cart_items_count".tr(namedArgs: {'count': cubit.cartItems.length.toString()}),
                        style: theme.textTheme.headlineMedium,
                      ),
                    ],
                  );
                },
              ),
              20.vGap,
              Expanded(
                child: BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox.shrink(),
                      loading: () => const Center(child: CircularProgressIndicator()),
                      failure: (message) => Center(
                        child: Text(message, style: const TextStyle(color: AppColors.red, fontSize: 16)),
                      ),
                      success: (items) {
                        if (items.isEmpty) {
                          return Center(
                            child: Text("cart_empty".tr(), style: const TextStyle(color: AppColors.grey, fontSize: 16)),
                          );
                        }
                        return ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemCount: items.length,
                          separatorBuilder: (context, index) => 12.vGap,
                          itemBuilder: (context, index) {
                            final cartItem = items[index];
                            final product = cartItem.product;
                            final num itemTotal = product.price * cartItem.quantity;
                            return Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: theme.primaryColor,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: AppColors.grey),
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      product.imageUrl,
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) => Container(
                                        width: 70,
                                        height: 70,
                                        color: AppColors.paleOrangeBg,
                                        child: const Icon(Icons.phone_android, color: AppColors.orange),
                                      ),
                                    ),
                                  ),
                                  12.hGap,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.category.name,
                                          style: theme.textTheme.labelLarge!.copyWith(color: AppColors.orange),
                                        ),
                                        4.vGap,
                                        Text(product.name, style: theme.textTheme.labelLarge),
                                        4.vGap,
                                        Text(
                                          'currency_egp'.tr(namedArgs: {'price': product.price.toString()}),
                                          style: theme.textTheme.labelLarge!.copyWith(color: AppColors.orange),
                                        ),
                                        6.vGap,
                                        Text(
                                          'cart_item_details'.tr(namedArgs: {
                                            'quantity': cartItem.quantity.toString(),
                                            'total': itemTotal.toString(),
                                          }),
                                          style: theme.textTheme.headlineSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete_outline, color: AppColors.red),
                                    onPressed: () => cubit.deleteCartItem(product.id),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("subtotal".tr(), style: theme.textTheme.headlineMedium),
                          Text(
                            "currency_egp".tr(namedArgs: {'price': cubit.totalPrice.toString()}),
                            style: theme.textTheme.labelLarge,
                          ),
                        ],
                      ),
                      8.vGap,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("total_label".tr(), style: theme.textTheme.titleLarge),
                          Text(
                            "currency_egp".tr(namedArgs: {'price': cubit.totalPrice.toString()}),
                            style: theme.textTheme.titleLarge!.copyWith(color: AppColors.orange),
                          ),
                        ],
                      ),
                      16.vGap,
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.orange,
                            disabledBackgroundColor: AppColors.orange.withValues(alpha: 0.4),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          ),
                          onPressed: cubit.cartItems.isEmpty
                              ? null
                              : () {
                            final checkoutArgs = CheckoutArgumentsModel(
                              cartItems: cubit.cartItems,
                              totalPrice: cubit.totalPrice,
                            );
                            Navigator.pushNamed(context, AppRoutes.checkout.route, arguments: checkoutArgs);
                          },
                          child: Text(
                            "proceed_to_checkout".tr(),
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.white),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}