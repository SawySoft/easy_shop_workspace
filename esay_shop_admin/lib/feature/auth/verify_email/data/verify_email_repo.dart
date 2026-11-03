import 'package:dio/dio.dart';

import '../../../../core/network/end_points.dart';

class VerifyEmailRepo {
  final Dio _dio;

  VerifyEmailRepo(this._dio);

  Future<Response> verifyOtp({required String email, required String otp}) async {
    final response = await _dio.post(EndPoints.verifyOtp, data: {'email': email, 'otp_code': otp});
    return response;
  }

  Future<Response> resendOtp({required String email}) async {
    final response = await _dio.post(EndPoints.resendOtp, data: {'email': email});
    return response;
  }
}
