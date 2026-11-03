import '../../../home/data/models/product_model.dart';

class CheckoutModel {
  final int id;
  final String date;
  final String code;
  final int clientId;
  final num totalPrice;
  final String address;
  final double latitude;
  final double longitude;
  final String paymentMethod;
  final String status;
  final List<OrderItemModel> orderItems;

  CheckoutModel({
    required this.id,
    required this.date,
    required this.code,
    required this.clientId,
    required this.totalPrice,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.paymentMethod,
    required this.status,
    required this.orderItems,
  });

  factory CheckoutModel.fromJson(Map<String, dynamic> json) {
    return CheckoutModel(
      id: json['id'] ?? 0,
      date: json['date'] ?? '',
      code: json['code'] ?? '',
      clientId: json['client_id'] ?? 0,
      totalPrice: json['total_price'] ?? 0,
      address: json['address'] ?? '',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      paymentMethod: json['payment_method'] ?? '',
      status: json['status'] ?? '',
      orderItems: json['order_items'] != null
          ? (json['order_items'] as List)
          .map((item) => OrderItemModel.fromJson(item))
          .toList()
          : [],
    );
  }
}

class OrderItemModel {
  final int id;
  final int orderId;
  final int productId;
  final num price;
  final int quantity;
  final num totalPrice;
  final ProductModel? product;

  OrderItemModel({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.price,
    required this.quantity,
    required this.totalPrice,
    this.product,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'] ?? 0,
      orderId: json['order_id'] ?? 0,
      productId: json['product_id'] ?? 0,
      price: json['price'] ?? 0,
      quantity: json['quantity'] ?? 0,
      totalPrice: json['total_price'] ?? 0,
      product: json['product'] != null ? ProductModel.fromJson(json['product']) : null,
    );
  }
}

