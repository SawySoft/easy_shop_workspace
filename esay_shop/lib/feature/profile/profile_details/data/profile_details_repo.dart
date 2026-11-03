import 'package:dio/dio.dart';

import '../../../../core/network/end_points.dart';

class ProfileDetailsRepo {
  final Dio _dio;
  ProfileDetailsRepo(this._dio);

  Future<Response> logout() async {
    final response = await _dio.post(EndPoints.logout,);
    return response;
  }
}