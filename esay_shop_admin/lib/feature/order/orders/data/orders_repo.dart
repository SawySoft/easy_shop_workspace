import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/network/end_points.dart';
import '../../models/order_model.dart';

class OrdersRepo {
  final Dio _dio;
  OrdersRepo(this._dio);
  Future<List<OrderModel>> getOrders() async {
    try {
      final response = await _dio.get(EndPoints.orders);

      final List list = response.data['data'] ?? [];
      debugPrint(list.toString());
      return list.map((json) => OrderModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}