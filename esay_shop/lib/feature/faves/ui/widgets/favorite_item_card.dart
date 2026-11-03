import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import '../../../../app/router/app_routes.dart';
import '../../../../app/theming/app_colors.dart';
import '../../../../feature/home/data/models/product_model.dart';

class FavoriteItemCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onToggleFavorite;

  const FavoriteItemCard({
    super.key,
    required this.product,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(
          AppRoutes.productDetails.route,
          arguments: product,
        ),
        child: Card(
          color: theme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: AppColors.grey),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.phone_android,
                        color: AppColors.blue,
                      ),
                    ),
                  ),
                ),
                14.hGap,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        product.category.name,
                        style: const TextStyle(
                          color: AppColors.orange,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      4.vGap,
                      Text(
                        product.name,
                        style: theme.textTheme.titleMedium,
                      ),
                      4.vGap,
                      Text(
                        'currency_egp'.tr(namedArgs: {'price': product.price.toString()}),
                        style: theme.textTheme.titleLarge!.copyWith(color: AppColors.orange),
                      ),
                      4.vGap,
                      Text(
                        product.admin.businessName ?? 'no_name_store'.tr(),
                        style: theme.textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: onToggleFavorite,
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.red,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}