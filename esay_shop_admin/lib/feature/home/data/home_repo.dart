import 'package:dio/dio.dart';
import 'package:esay_shop_admin/core/network/end_points.dart';

import 'models/dashboard_entity.dart';
import 'models/dashboard_model.dart';

class HomeRepo {
  final Dio _dio;

  HomeRepo(this._dio);

  Future<DashboardEntity> getDashboardData() async {
    try {
      // 1. تنفيذ الطلبات بشكل متزامن
      final responses = await Future.wait([
        _dio.get(EndPoints.products),
        _dio.get(EndPoints.orders),
        _dio.get(EndPoints.categories),
      ]);

      // 2. تفويض عملية الـ Parsing والتحليل للـ Model مباشرة
      return DashboardModel.fromResponses(
        productsData: responses[0].data,
        ordersData: responses[1].data,
        categoriesData: responses[2].data,
      );

    } catch (e) {
      throw Exception('Failed to load dashboard data: $e');
    }
  }
}