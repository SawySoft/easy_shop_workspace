import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../app/theming/app_colors.dart';
import '../../../../../core/utils/extensions/num_extensions.dart';
import '../../../models/product_model.dart';
import '../../../product_details/ui/product_details_screen.dart';

class ProductItemCard extends StatelessWidget {
  final ProductModel product;

  const ProductItemCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final bool isVisible = product.visible == 1;

    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(product))),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.02),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 50,
                height: 50,
                color: AppColors.grey,
                child: product.image != null && product.image!.isNotEmpty
                    ? Image.network(
                  product.image!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.headphones, color: AppColors.grey, size: 24),
                )
                    : const Icon(Icons.headphones, color: AppColors.grey, size: 24),
              ),
            ),
            12.hGap,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product.name ?? 'product_item_default_name'.tr(),
                    style: textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  2.vGap,
                  Text(
                    'product_price_qty_format'.tr(namedArgs: {
                      'price': '${product.price ?? 0}',
                      'qty': '${product.quantity ?? 0}',
                    }),
                    style: textTheme.headlineSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            8.hGap,
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                12.vGap,
                Icon(Icons.arrow_forward_ios_rounded, size: 14, color: AppColors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}