import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/theming/app_colors.dart';
import '../../../../../core/shred/logic/favorite/favorite_cubit.dart';
import '../favorite_item_card.dart';

class TabletFavesScreen extends StatelessWidget {
  const TabletFavesScreen({super.key});

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
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(color: Colors.orange.withValues(alpha: 0.1), shape: BoxShape.circle),
                        child: const Icon(Icons.favorite_border, size: 44, color: AppColors.orange),
                      ),
                      const SizedBox(height: 16),
                      Text('no_favorites_title'.tr(), style: theme.textTheme.titleLarge?.copyWith(fontSize: 22)),
                      const SizedBox(height: 8),
                      Text(
                        'no_favorites_subtitle'.tr(),
                        style: const TextStyle(color: AppColors.grey, fontSize: 15),
                      ),
                    ],
                  ),
                );
              }
              return Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 850),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(24),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 2.8,
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