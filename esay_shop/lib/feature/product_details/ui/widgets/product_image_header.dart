import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/theming/app_colors.dart';
import '../../../../core/shred/logic/favorite/favorite_cubit.dart';
import '../../../home/data/models/product_model.dart';
import 'header_icon_button.dart';

class ProductImageHeader extends StatelessWidget {
  final ProductModel productModel;

  const ProductImageHeader(this.productModel, {super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SizedBox(
      height: 280,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(child: Image.network(productModel.imageUrl, fit: BoxFit.cover)),
          Positioned(
            top: 48,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeaderIconButton(icon: Icons.arrow_back, onPressed: () => Navigator.maybePop(context)),
                BlocBuilder<FavoriteCubit, FavoriteState>(
                  builder: (context, state) {
                    final favorite = context.read<FavoriteCubit>();
                    final bool isFav = favorite.isFavorite(productModel.id.toString());
                    return InkWell(
                      onTap: () {
                        favorite.toggleFavorite(productModel);
                      },
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          size: 32,
                          color: isFav ? AppColors.red : AppColors.grey,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
