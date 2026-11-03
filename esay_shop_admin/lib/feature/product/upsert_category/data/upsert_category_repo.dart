import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../core/network/end_points.dart';

class UpsertCategoryRepo {
  final Dio _dio;
  UpsertCategoryRepo(this._dio);

  Future<Response> addCategory(dynamic data) async {
    try {
      final response = await _dio.post(
        EndPoints.categoriesStore,
        data: data,
      );
      return response;
    } catch (e) {
      log('Add Category Repo Error: $e');
      rethrow;
    }
  }

  Future<Response> updateCategory(dynamic data, {required String categorySlug}) async {
    try {
      final response = await _dio.put(
        '${EndPoints.categoriesUpdate}$categorySlug',
        data: data,
      );
      return response;
    } catch (e) {
      log('Update Category Repo Error: $e');
      rethrow;
    }
  }
}