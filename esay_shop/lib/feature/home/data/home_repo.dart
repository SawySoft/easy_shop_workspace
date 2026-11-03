import 'package:dio/dio.dart';
import '../../../core/network/end_points.dart';
import 'models/category_model.dart';
import 'models/product_model.dart';

class HomeRepo {
  final Dio _dio;
  HomeRepo(this._dio);

  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await _dio.get(EndPoints.categories);

      final List list = response.data['data'] ?? [];
      return list.map((json) => CategoryModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await _dio.get(EndPoints.products);

      final List list = response.data['data'] ?? [];
      return list.map((json) => ProductModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}