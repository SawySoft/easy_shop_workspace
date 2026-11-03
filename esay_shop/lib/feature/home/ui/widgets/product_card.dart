import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop/app/theming/app_colors.dart';
import 'package:esay_shop/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shred/logic/favorite/favorite_cubit.dart';
import '../../data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onFaves, onTap;

  const ProductCard({
    required this.onFaves,
    required this.onTap,
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isOutOfStock = product.quantity <= 0;

    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.03),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.network(
                      product.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: AppColors.grey,
                        alignment: Alignment.center,
                        child: const Icon(Icons.image_not_supported, color: AppColors.grey),
                      ),
                    ),
                  ),
                  if (isOutOfStock)
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.black.withValues(alpha: 0.35),
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        alignment: Alignment.center,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'out_of_stock'.tr(),
                            style: const TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                    ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                      ),
                      child: BlocBuilder<FavoriteCubit, FavoriteState>(
                        builder: (context, state) {
                          final favorite = context.read<FavoriteCubit>();
                          final bool isFav = favorite.isFavorite(product.id.toString());
                          return InkWell(
                            onTap: () {
                              favorite.toggleFavorite(product);
                            },
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: Icon(
                                isFav ? Icons.favorite : Icons.favorite_border,
                                size: 24,
                                color: isFav ? AppColors.red : AppColors.grey,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category.name,
                    style: const TextStyle(fontSize: 11, color: AppColors.orange, fontWeight: FontWeight.w500),
                  ),
                  2.vGap,
                  Text(
                    product.name,
                    style: theme.textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  4.vGap,
                  Text(
                    'currency_egp'.tr(namedArgs: {'price': product.price.toString()}),
                    style: theme.textTheme.titleMedium!.copyWith(color: AppColors.orange),
                  ),
                  2.vGap,
                  Text(
                    'seller_by_prefix'.tr(namedArgs: {'name': product.admin.businessName ?? product.admin.name}),
                    style: theme.textTheme.headlineSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}