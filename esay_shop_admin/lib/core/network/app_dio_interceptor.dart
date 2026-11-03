import 'package:bingo/bingo.dart';
import 'package:dio/dio.dart';
import 'package:esay_shop_admin/core/network/end_points.dart';
import 'package:flutter/foundation.dart';

class AppDioInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({
      'x-api-key': EndPoints.apiKey,
      'Accept': 'application/json',
      if (options.data is !FormData) 'Content-Type': 'application/json',
    });
    if (!['login', 'register', 'otp'].any(options.path.contains)) {
      final String? token = Bingo.call<String>("token");
      if (token?.isNotEmpty ?? false) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    if (kDebugMode) {
      debugPrint('🌐 REQUEST [${options.method}] => ${options.path}');
    }

    super.onRequest(options, handler);
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('==================== 📥 RESPONSE ====================');
      debugPrint('STATUS: [${response.statusCode}] => PATH: ${response.requestOptions.path}');
      debugPrint('RESPONSE DATA: ${response.data}');
      debugPrint('====================================================');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('==================== ❌ ERROR ====================');
      debugPrint('STATUS CODE: [${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
      debugPrint('ERROR MESSAGE: ${err.message}');
      if (err.response?.data != null) {
        debugPrint('RESPONSE ERROR DATA: ${err.response?.data}');
      }
      debugPrint('==================================================');
    }

    super.onError(err, handler);
  }
}
