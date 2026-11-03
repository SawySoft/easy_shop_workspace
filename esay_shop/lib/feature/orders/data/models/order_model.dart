class OrderModel {
  final int? id;
  final String? code;
  final String? date;
  final String? status;
  final num? totalPrice;
  final String? paymentMethod;
  final int? itemsCount;

  OrderModel({
    this.id,
    this.code,
    this.date,
    this.status,
    this.totalPrice,
    this.paymentMethod,
    this.itemsCount,
  });
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      code: json['code'],
      date: json['date'],
      status: json['status'],
      totalPrice: json['total_price'],
      paymentMethod: json['payment_method'],
      itemsCount: json['order_items'] != null
          ? (json['order_items'] as List).length
          : (json['items_count'] ?? 1),
    );
  }

}