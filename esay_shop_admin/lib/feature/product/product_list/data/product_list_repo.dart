import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../core/network/end_points.dart';

class ProductListRepo {
  final Dio _dio;
  ProductListRepo(this._dio);

  Future<Response> getProducts() async {
    try {
      final response = await _dio.get(EndPoints.products);
      return response;
    } catch (e) {
      log('Get Products Repo Error: $e');
      rethrow;
    }
  }

  Future<Response> storeProduct(dynamic data) async {
    try {
      final response = await _dio.post(
        '/admin/products/store',
        data: data,
      );
      return response;
    } catch (e) {
      log('Store Product Repo Error: $e');
      rethrow;
    }
  }
}