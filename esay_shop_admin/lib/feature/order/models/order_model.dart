import 'client_model.dart';
import 'order_item_model.dart';

class OrderModel {
  final int? id;
  final String? date;
  final String? code;
  final int? clientId;
  final num? totalPrice;
  final String? address;
  final double? latitude;
  final double? longitude;
  final String? paymentMethod;
  final String? status;
  final ClientModel? client;
  final List<OrderItemModel>? orderItems;

  OrderModel({
    this.id,
    this.date,
    this.code,
    this.clientId,
    this.totalPrice,
    this.address,
    this.latitude,
    this.longitude,
    this.paymentMethod,
    this.status,
    this.client,
    this.orderItems,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      date: json['date'],
      code: json['code'],
      clientId: json['client_id'],
      totalPrice: json['total_price'],
      address: json['address'],
      latitude: json['latitude'] != null ? (json['latitude'] as num).toDouble() : null,
      longitude: json['longitude'] != null ? (json['longitude'] as num).toDouble() : null,
      paymentMethod: json['payment_method'],
      status: json['status'],
      client: json['client'] != null ? ClientModel.fromJson(json['client']) : null,
      orderItems: json['order_items'] != null
          ? (json['order_items'] as List)
          .map((item) => OrderItemModel.fromJson(item))
          .toList()
          : null,
    );
  }
}