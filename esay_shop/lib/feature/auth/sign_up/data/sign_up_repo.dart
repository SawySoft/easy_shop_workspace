import 'package:dio/dio.dart';

import '../../../../core/network/end_points.dart';

class SignUpRepo {
  final Dio dio;

  SignUpRepo(this.dio);
  Future<Response> registerClient(FormData formData) async {
    return await dio.post(
      EndPoints.register,
      data: formData,
    );
  }
}