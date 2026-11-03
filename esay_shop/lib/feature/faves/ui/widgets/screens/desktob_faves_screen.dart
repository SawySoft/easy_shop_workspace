import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/theming/app_colors.dart';
import '../../../../../core/shred/logic/favorite/favorite_cubit.dart';
import '../favorite_item_card.dart';

class DesktopFavesScreen extends StatelessWidget {
  const DesktopFavesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(title: Text('favorites_title'.tr()), centerTitle: true, backgroundColor: theme.primaryColor),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          final favoriteCubit = context.read<FavoriteCubit>();

          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (favoriteProducts) {
              if (favoriteProducts.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(color: Colors.orange.withValues(alpha: 0.1), shape: BoxShape.circle),
                        child: const Icon(Icons.favorite_border, size: 50, color: AppColors.orange),
                      ),
                      const SizedBox(height: 20),
                      Text('no_favorites_title'.tr(), style: theme.textTheme.titleLarge?.copyWith(fontSize: 26)),
                      const SizedBox(height: 10),
                      Text(
                        'no_favorites_subtitle'.tr(),
                        style: const TextStyle(color: AppColors.grey, fontSize: 16),
                      ),
                    ],
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('my_favorite_products'.tr(), style: theme.textTheme.titleLarge?.copyWith(fontSize: 28)),
                    const SizedBox(height: 24),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 3.0,
                        ),
                        itemCount: favoriteProducts.length,
                        itemBuilder: (context, index) {
                          final product = favoriteProducts[index];

                          return FavoriteItemCard(
                            product: product,
                            onToggleFavorite: () {
                              favoriteCubit.toggleFavorite(product);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
            failure: (message) => Center(child: Text('error_prefix'.tr(namedArgs: {'message': message}))),
            orElse: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}