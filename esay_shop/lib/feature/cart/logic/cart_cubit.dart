import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/cart_repo.dart';
import '../data/models/cart_item_model.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _repo;

  CartCubit(this._repo) : super(const CartState.initial()) {getCartItems();}

  List<CartItemModel> cartItems = [];


  Future<void> getCartItems() async {
    emit(const CartState.loading());
    try {
      final response = await _repo.getCarts();
      final List data = response.data['data'] ?? [];

      cartItems = data.map((e) => CartItemModel.fromJson(e)).toList();
      emit(CartState.success(cartItems));
    } catch (e) {
      emit(CartState.failure(e.toString()));
    }
  }

  Future<void> deleteCartItem(int productId) async {
    try {
      await _repo.deleteCartItem(productId);

      cartItems.removeWhere((item) => item.productId == productId);

      emit(const CartState.initial());
      emit(CartState.success(cartItems));
    } catch (e) {
      emit(CartState.failure(e.toString()));
    }
  }

  int get totalPrice {
    return cartItems.fold(
      0,
          (sum, item) => sum + (item.product.price * item.quantity),
    );
  }
}