import 'package:dio/dio.dart';

import '../../../core/network/end_points.dart';

class ProductDetailsRepo {
  final Dio _dio;

  ProductDetailsRepo(this._dio);

  Future<Response> addToCart({required int productId, required int quantity}) async {
    final response = await _dio.post(EndPoints.cartsStore, data: {'product_id': productId, 'quantity': quantity});
    return response;
  }
}
