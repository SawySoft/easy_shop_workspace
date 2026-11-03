import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop_admin/app/router/app_routes.dart';
import 'package:esay_shop_admin/app/theming/app_colors.dart';
import 'package:esay_shop_admin/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import '../../../product/models/product_model.dart';
import '../../../product/product_details/ui/product_details_screen.dart';

class ProductsOverviewSection extends StatelessWidget {
  final List<ProductModel> products;

  const ProductsOverviewSection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final displayedProducts = products.take(3).toList();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'products_overview_title'.tr(),
              style: textTheme.titleMedium,
            ),
            InkWell(
              onTap: () => Navigator.of(context).pushNamed(AppRoutes.productList.route),
              child: Text('see_all'.tr(), style: textTheme.labelLarge!.copyWith(color: AppColors.orange)),
            ),
          ],
        ),
        12.vGap,
        if (products.isEmpty)
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('no_products_found'.tr(), style: const TextStyle(color: AppColors.grey)),
            ),
          )
        else
          ...displayedProducts.map((product) {
            final bool isVisible = product.visible == 1;
            return InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(product))),
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.02),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            width: 45,
                            height: 45,
                            color: AppColors.grey,
                            child: product.image != null && product.image!.isNotEmpty
                                ? Image.network(
                              product.image!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.headphones, color: AppColors.grey),
                            )
                                : const Icon(Icons.headphones, color: AppColors.grey),
                          ),
                        ),
                        12.hGap,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name ?? '',
                              style: textTheme.titleMedium,
                            ),
                            2.vGap,
                            Text(
                              'product_price_qty_format'.tr(namedArgs: {
                                'price': '${product.price ?? 0}',
                                'qty': '${product.quantity ?? 0}',
                              }),
                              style: textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: isVisible ? AppColors.mintGreen : AppColors.redLight,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        isVisible ? 'product_visible'.tr() : 'product_hidden'.tr(),
                        style: TextStyle(
                          color: isVisible ? AppColors.green : AppColors.red,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
      ],
    );
  }
}