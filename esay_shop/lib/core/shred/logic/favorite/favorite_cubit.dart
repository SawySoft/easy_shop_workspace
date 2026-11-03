import 'package:esay_shop/core/shred/logic/favorite/repo/favorite_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../feature/home/data/models/product_model.dart';

part 'favorite_state.dart';
part 'favorite_cubit.freezed.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepo _repo;

  FavoriteCubit(this._repo) : super(const FavoriteState.initial()) {
    getFavorites();
  }

  final List<ProductModel> _favoriteProducts = [];

  List<String> get favoriteProductIds =>
      _favoriteProducts.map((p) => p.id.toString()).toList();

  Future<void> getFavorites() async {
    emit(const FavoriteState.loading());
    try {
      final response = await _repo.getFavorites();
      _favoriteProducts.clear();

      for (var item in response.data['data']) {
        if (item['product'] != null) {
          _favoriteProducts.add(ProductModel.fromJson(item['product']));
        }
      }

      emit(FavoriteState.success(List.from(_favoriteProducts)));
    } catch (e) {
      emit(FavoriteState.failure(e.toString()));
    }
  }

  Future<void> toggleFavorite(ProductModel product) async {
    final productId = product.id.toString();
    final bool isAlreadyFav = favoriteProductIds.contains(productId);

    if (isAlreadyFav) {
      _favoriteProducts.removeWhere((p) => p.id.toString() == productId);
      emit(FavoriteState.success(List.from(_favoriteProducts)));
      await _repo.destroyFavorite(productId);
    } else {
      _favoriteProducts.add(product);
      emit(FavoriteState.success(List.from(_favoriteProducts)));
      await _repo.toggleFavorite(productId);
    }
  }

  bool isFavorite(String productId) {
    return favoriteProductIds.contains(productId);
  }
}