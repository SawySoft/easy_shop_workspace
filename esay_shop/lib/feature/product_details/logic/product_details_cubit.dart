import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop/feature/home/data/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/product_details_repo.dart';

part 'product_details_state.dart';

part 'product_details_cubit.freezed.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductDetailsRepo _repo;
  final ProductModel productModel;

  ProductDetailsCubit(this._repo, this.productModel) : super(const ProductDetailsState.initial());

  int quantity = 1;

  void incrementQuantity() {
    if (quantity < productModel.quantity) {
      quantity++;
      emit(ProductDetailsState.quantityChanged(quantity));
    }
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
      emit(ProductDetailsState.quantityChanged(quantity));
    }
  }

  Future<void> addToCart() async {
    emit(const ProductDetailsState.loading());
    try {
      await _repo.addToCart(productId: productModel.id, quantity: quantity);

      emit(ProductDetailsState.success('added_to_cart_success'.tr()));
    } catch (e) {
      emit(ProductDetailsState.failure(e.toString()));
    }
  }
}