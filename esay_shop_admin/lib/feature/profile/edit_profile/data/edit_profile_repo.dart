

import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../core/network/end_points.dart';

class EditProfileRepo {
  final Dio dio;

  EditProfileRepo(this.dio);

  Future<Response> updateProfile(FormData formData) async {
    try {
      final response = await dio.post(
        EndPoints.updateProfile,
        data: formData,
      );
      return response;
    } catch (e) {
      log('Update Profile Repo Error: $e');
      rethrow;
    }
  }
}