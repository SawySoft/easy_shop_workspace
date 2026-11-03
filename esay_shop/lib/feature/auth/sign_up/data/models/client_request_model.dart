import 'dart:io';
import 'package:dio/dio.dart';

class ClientRequestModel {
  final String? name;
  final String? email;
  final String? phone;
  final String? password;
  final String? passwordConfirmation;
  final String? address;
  final String? latitude;
  final String? longitude;
  final dynamic picture;

  ClientRequestModel({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.passwordConfirmation,
    this.address,
    this.latitude,
    this.longitude,
    this.picture,
  });

  Future<FormData> toFormData() async {
    final Map<String, dynamic> map = {};

    if (name != null) map['name'] = name;
    if (email != null) map['email'] = email;
    if (phone != null) map['phone'] = phone;
    if (password != null) map['password'] = password;
    if (passwordConfirmation != null) map['password_confirmation'] = passwordConfirmation;
    if (address != null) map['address'] = address;
    if (latitude != null) map['latitude'] = latitude;
    if (longitude != null) map['longitude'] = longitude;

    if (picture != null) {
      final String path = picture is File ? picture.path : picture.toString();
      map['picture'] = await MultipartFile.fromFile(
        path,
        filename: path.split('/').last,
      );
    }



    return FormData.fromMap(map);
  }
}