import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../core/network/end_points.dart';

class CategoryListRepo {
  final Dio _dio;
  CategoryListRepo(this._dio);

  Future<Response> getCategories() async {
    try {
      final response = await _dio.get(EndPoints.categories);
      return response;
    } catch (e) {
      log('Get Categories Repo Error: $e');
      rethrow;
    }
  }


  Future<Response> storeCategory(dynamic data) async {
    try {
      final response = await _dio.post(
        EndPoints.categoriesStore,
        data: data,
      );
      return response;
    } catch (e) {
      log('Store Category Repo Error: $e');
      rethrow;
    }
  }
}