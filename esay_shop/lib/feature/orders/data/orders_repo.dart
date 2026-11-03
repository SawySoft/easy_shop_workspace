import 'package:dio/dio.dart';
import 'package:esay_shop/feature/orders/data/models/order_model.dart';

import '../../../core/network/end_points.dart';

class OrdersRepo {
  final Dio _dio;
  OrdersRepo(this._dio);
  Future<List<OrderModel>> getOrders() async {
    try {
      final response = await _dio.get(EndPoints.orders);

      final List list = response.data['data'] ?? [];
      return list.map((json) => OrderModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}