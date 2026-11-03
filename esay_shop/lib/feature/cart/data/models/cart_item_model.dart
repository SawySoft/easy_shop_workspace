import '../../../home/data/models/product_model.dart';

class CartItemModel {
  final int id;
  final int clientId;
  final int productId;
  final int quantity;
  final ProductModel product;

  CartItemModel({
    required this.id,
    required this.clientId,
    required this.productId,
    required this.quantity,
    required this.product,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'] ?? 0,
      clientId: json['client_id'] ?? 0,
      productId: json['product_id'] ?? 0,
      quantity: json['quantity'] ?? 1,
      product: json['product'] != null
          ? ProductModel.fromJson(json['product'])
          : ProductModel.empty(),
    );
  }
}