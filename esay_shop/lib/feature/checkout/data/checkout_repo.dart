import 'package:dio/dio.dart';

import '../../../core/network/end_points.dart';
import 'models/checkout_model.dart';
class CheckoutRepo {
  final Dio _dio;
  CheckoutRepo(this._dio);

  Future<CheckoutModel> createOrder({
    required List<int> productIds,
    required List<int> quantities,
    required List<int> prices,
    required String address,
    required double latitude,
    required double longitude,
    required String paymentMethod,
  }) async {
    final response = await _dio.post(
      EndPoints.ordersStore,
      data: {
        "product_id": productIds,
        "quantity": quantities,
        "price": prices,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "payment_method": paymentMethod,
      },
    );
    return CheckoutModel.fromJson(response.data['data']);
  }
}

