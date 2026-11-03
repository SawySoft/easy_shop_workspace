import 'package:dio/dio.dart';

import '../../../core/network/end_points.dart';

class CartRepo {
  final Dio _dio;

  CartRepo(this._dio);

  Future<Response> getCarts() async {
    final response = await _dio.get(EndPoints.carts);
    return response;
  }


  Future<Response> deleteCartItem(int productId) async {
    final response = await _dio.delete(EndPoints.cartsDestroy, data: {"product_id": productId});
    return response;
  }
}
