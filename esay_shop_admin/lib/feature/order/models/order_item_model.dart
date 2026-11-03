class OrderItemModel {
  final int? id;
  final int? orderId;
  final int? productId;
  final num? price;
  final int? quantity;
  final num? totalPrice;
  final String? productName;
  final String? productImage;
  final String? categoryName;

  OrderItemModel({
    this.id,
    this.orderId,
    this.productId,
    this.price,
    this.quantity,
    this.totalPrice,
    this.productName,
    this.productImage,
    this.categoryName,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    final productJson = json['product'] as Map<String, dynamic>?;
    final categoryJson = productJson?['category'] as Map<String, dynamic>?;

    return OrderItemModel(
      id: json['id'],
      orderId: json['order_id'],
      productId: json['product_id'],
      price: json['price'],
      quantity: json['quantity'],
      totalPrice: json['total_price'],
      productName: productJson?['name'],
      productImage: productJson?['image_url'],
      categoryName: categoryJson?['name'],
    );
  }
}