import 'dart:io';
import 'package:dio/dio.dart';

class AdminRequestModel {
  final String? name;
  final String? email;
  final String? phone;
  final String? password;
  final String? passwordConfirmation;
  final String? nationalId;
  final String? businessName;
  final String? address;
  final String? latitude;
  final String? longitude;
  final dynamic picture;
  final dynamic commercialRegister;
  final dynamic taxCard;

  AdminRequestModel({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.passwordConfirmation,
    this.nationalId,
    this.businessName,
    this.address,
    this.latitude,
    this.longitude,
    this.picture,
    this.commercialRegister,
    this.taxCard,
  });

  Future<FormData> toFormData() async {
    final Map<String, dynamic> map = {};

    if (name != null) map['name'] = name;
    if (email != null) map['email'] = email;
    if (phone != null) map['phone'] = phone;
    if (password != null) map['password'] = password;
    if (passwordConfirmation != null) map['password_confirmation'] = passwordConfirmation;
    if (nationalId != null) map['national_id'] = nationalId;
    if (businessName != null) map['business_name'] = businessName;
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

    if (commercialRegister != null) {
      final String path = commercialRegister is File ? commercialRegister.path : commercialRegister.toString();
      map['commercial_register'] = await MultipartFile.fromFile(
        path,
        filename: path.split('/').last,
      );
    }

    if (taxCard != null) {
      final String path = taxCard is File ? taxCard.path : taxCard.toString();
      map['tax_card'] = await MultipartFile.fromFile(
        path,
        filename: path.split('/').last,
      );
    }

    return FormData.fromMap(map);
  }
}