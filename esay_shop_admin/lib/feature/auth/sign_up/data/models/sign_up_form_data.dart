
import 'dart:io';
import 'package:dio/dio.dart';

class SignUpFormData {
  final File? commercialRegister;
  final File? taxCard;
  final File? imageProfile;
  final double? latitude;
  final double? longitude;

  const SignUpFormData({
    this.commercialRegister,
    this.taxCard,
    this.imageProfile,
    this.latitude,
    this.longitude,
  });

  SignUpFormData copyWith({
    File? commercialRegister,
    File? taxCard,
    File? imageProfile,
    double? latitude,
    double? longitude,
  }) {
    return SignUpFormData(
      commercialRegister: commercialRegister ?? this.commercialRegister,
      taxCard: taxCard ?? this.taxCard,
      imageProfile: imageProfile ?? this.imageProfile,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}

extension SignUpFormDataExtension on SignUpFormData {
  Future<Map<String, dynamic>> toMultipartMap() async {
    final map = <String, dynamic>{};

    if (latitude != null) map['latitude'] = latitude.toString();
    if (longitude != null) map['longitude'] = longitude.toString();

    if (imageProfile != null) {
      map['picture'] = await MultipartFile.fromFile(
        imageProfile!.path,
        filename: imageProfile!.path.split('/').last,
      );
    }

    if (commercialRegister != null) {
      map['commercial_register'] = await MultipartFile.fromFile(
        commercialRegister!.path,
        filename: commercialRegister!.path.split('/').last,
      );
    }

    if (taxCard != null) {
      map['tax_card'] = await MultipartFile.fromFile(
        taxCard!.path,
        filename: taxCard!.path.split('/').last,
      );
    }

    return map;
  }
}