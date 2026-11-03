import 'package:dio/dio.dart';
import 'end_points.dart';
import 'app_dio_interceptor.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (_dio == null) {
      _dio = Dio(
        BaseOptions(
          baseUrl: EndPoints.baseUrl,
          connectTimeout: timeOut,
          receiveTimeout: timeOut,
          headers: {'Accept': 'application/json', 'x-api-key': EndPoints.apiKey},
        ),
      );
      _dio?.interceptors.add(AppDioInterceptor());
      _dio?.interceptors.add(LogInterceptor(requestBody: true, responseBody: true, error: true, requestHeader: false));
      return _dio!;
    } else {
      return _dio!;
    }
  }
}