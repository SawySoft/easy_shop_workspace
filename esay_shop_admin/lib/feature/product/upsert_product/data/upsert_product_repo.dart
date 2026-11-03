import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:esay_shop_admin/core/network/end_points.dart';

class UpsertProductRepo {
  final Dio _dio;
  UpsertProductRepo(this._dio);

  Future<Response> addProduct(dynamic data) async {
    try {
      final response = await _dio.post(
        EndPoints.productsStore,
        data: data,
      );
      return response;
    } catch (e) {
      log('Store Product Repo Error: $e');
      rethrow;
    }
  }

  Future<Response> updateProduct(dynamic data, {required String productSlug}) async {
    try {
      final response = await _dio.post(
        '/admin/products/update/$productSlug',
        data: data,
      );
      return response;
    } catch (e) {
      log('Update Product Repo Error: $e');
      rethrow;
    }
  }
}