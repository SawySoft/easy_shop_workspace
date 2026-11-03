import '../../../cart/data/models/cart_item_model.dart';

class CheckoutArgumentsModel {
  final List<CartItemModel> cartItems;
  final num totalPrice;

  CheckoutArgumentsModel({
    required this.cartItems,
    required this.totalPrice,
  });
}