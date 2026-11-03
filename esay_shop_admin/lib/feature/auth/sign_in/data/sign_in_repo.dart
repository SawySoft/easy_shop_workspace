import 'package:dio/dio.dart';
import 'package:esay_shop_admin/core/network/end_points.dart';

class SignInRepo {
  final Dio _dio;

  SignInRepo(this._dio);

  Future<Response> login({required String email, required String password}) async {
    final response = await _dio.post(
      EndPoints.login,
      data: {
        'email': email,
        'password': password,
      },
    );
    return response;
  }
}