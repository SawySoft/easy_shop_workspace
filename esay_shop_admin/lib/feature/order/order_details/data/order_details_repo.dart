import 'package:dio/dio.dart';
import 'package:esay_shop_admin/feature/order/models/order_model.dart';

import '../../../../core/network/end_points.dart';
import '../../../product/models/product_model.dart';

class OrderDetailsRepo {
  final Dio _dio;
  OrderDetailsRepo(this._dio);
  Future<OrderModel> getProductDetails(String productCode) async {
    try {
      final response = await _dio.get('${EndPoints.ordersDetails}$productCode');

      final data = response.data['data'] ?? response.data;

      return OrderModel.fromJson(data);
    } catch (e) {
      throw Exception('Failed to load product details: ${e.toString()}');
    }
  }
}