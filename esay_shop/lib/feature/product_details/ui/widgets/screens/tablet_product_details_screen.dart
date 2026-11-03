import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop/app/theming/app_colors.dart';
import 'package:esay_shop/core/utils/extensions/num_extensions.dart';
import 'package:esay_shop/feature/product_details/ui/widgets/add_to_cart_button.dart';
import 'package:esay_shop/feature/product_details/ui/widgets/product_image_header.dart';
import 'package:esay_shop/feature/product_details/ui/widgets/quantity_selector.dart';
import 'package:esay_shop/feature/product_details/ui/widgets/stock_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/data/models/product_model.dart';
import '../../../logic/product_details_cubit.dart';

class TabletProductDetailsScreen extends StatelessWidget {
  const TabletProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final cubit = context.read<ProductDetailsCubit>();
    final ProductModel product = cubit.productModel;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(title: Text('product_details_title'.tr()), centerTitle: true),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 850),
            padding: const EdgeInsets.all(24.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ProductImageHeader(product),
                  ),
                ),
                32.hGap,
                Expanded(
                  flex: 6,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.paleOrangeBg,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            product.category.name,
                            style: const TextStyle(color: AppColors.orange, fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                        12.vGap,
                        Text(product.name, style: theme.textTheme.titleLarge?.copyWith(fontSize: 26)),
                        8.vGap,
                        Text(
                          'currency_egp'.tr(namedArgs: {'price': product.price.toString()}),
                          style: theme.textTheme.titleLarge!.copyWith(color: AppColors.orange, fontSize: 22),
                        ),
                        16.vGap,
                        Row(
                          children: [
                            const Icon(Icons.storefront_outlined, size: 18, color: AppColors.orange),
                            6.hGap,
                            Text('sold_by_prefix'.tr(), style: theme.textTheme.headlineSmall),
                            Text(product.admin.businessName ?? "", style: theme.textTheme.labelMedium),
                          ],
                        ),
                        20.vGap,
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: theme.primaryColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('description_title'.tr(), style: theme.textTheme.headlineSmall),
                              8.vGap,
                              Text(product.description ?? "", style: theme.textTheme.labelMedium),
                            ],
                          ),
                        ),
                        20.vGap,
                        BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                          builder: (context, state) {
                            return Row(
                              children: [
                                Expanded(child: StockBadge(unitsLeft: product.quantity)),
                                16.hGap,
                                Expanded(
                                  child: QuantitySelector(
                                    quantity: cubit.quantity,
                                    onIncrement: () => cubit.incrementQuantity(),
                                    onDecrement: () => cubit.decrementQuantity(),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        28.vGap,
                        BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
                          listener: (context, state) {
                            state.whenOrNull(
                              success: (message) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(message.tr()), backgroundColor: AppColors.green),
                                );
                              },
                              failure: (message) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('error_prefix'.tr(namedArgs: {'message': message})),
                                    backgroundColor: AppColors.red,
                                  ),
                                );
                              },
                            );
                          },
                          builder: (context, state) {
                            final bool isSuccess = state.maybeWhen(
                              success: (_) => true,
                              orElse: () => false,
                            );
                            return SizedBox(
                              width: double.infinity,
                              child: AddToCartButton(
                                isAdded: isSuccess,
                                onPressed: () {
                                  cubit.addToCart();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}