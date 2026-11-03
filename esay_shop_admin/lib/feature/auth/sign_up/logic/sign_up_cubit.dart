import 'dart:io';

import 'package:dio/dio.dart';
import 'package:bingo/bingo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:esay_shop_admin/feature/auth/sign_up/logic/sign_up_state.dart';

import '../../../../core/shred/logic/admin_form_controllers_mixin.dart';
import '../../../../core/shred/logic/api_error_handler.dart';
import '../../../../core/shred/logic/location_helper.dart';
import '../../../../core/shred/logic/validators.dart';
import '../data/sign_up_repo.dart';
import '../data/models/admin_request_model.dart';

class SignUpCubit extends Cubit<SignUpState> with AdminFormControllersMixin {
  final SignUpRepo _repo;

  SignUpCubit(this._repo) : super(const SignUpState.initial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  File? commercialRegister;
  File? taxCard;
  File? imageProfile;
  double? latitude;
  double? longitude;

  void setCommercialRegister(File file) {
    commercialRegister = file;
    emit(const SignUpState.initial());
  }

  void setTaxCard(File file) {
    taxCard = file;
    emit(const SignUpState.initial());
  }

  void setProfileImage(File file) {
    imageProfile = file;
    emit(const SignUpState.initial());
  }

  Future<void> getCurrentLocation() async {
    emit(const SignUpState.loading());
    try {
      final pos = await LocationHelper.getCurrentPosition();
      latitude = pos.latitude;
      longitude = pos.longitude;
      final address = await LocationHelper.getAddressFromCoordinates(latitude!, longitude!);
      emit(SignUpState.success(responseMessage: address));
    } catch (e) {
      emit(SignUpState.failure(e.toString()));
    }
  }

  void removeLocation() {
    latitude = null;
    longitude = null;
    emit(const SignUpState.initial());
  }

  String? validateName(String? value) => Validators.validateName(value);
  String? validateEmail(String? value) => Validators.validateEmail(value);
  String? validatePhone(String? value) => Validators.validatePhone(value);
  String? validateNationalId(String? value) => Validators.validateNationalId(value);
  String? validatePassword(String? value) => Validators.validatePassword(value);
  String? validateConfirmPassword(String? value) {
    return Validators.validateConfirmPassword(value, passwordController.text);
  }
  String? validateOtp(String? value) => Validators.validateOtp(value);

  Future<void> register() async {
    if (passwordController.text.trim() != confirmPasswordController.text.trim()) {
      emit(const SignUpState.failure('val_passwords_not_match'));
      return;
    }

    emit(const SignUpState.loading());

    try {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      final nationalId = nationalIdController.text.trim();
      final confirmPassword = confirmPasswordController.text.trim();
      final phone = phoneController.text.trim();

      AdminRequestModel adminModel = AdminRequestModel(
        name: nameController.text.trim(),
        email: email,
        phone: "+2$phone",
        password: password,
        nationalId: nationalId,
        passwordConfirmation: confirmPassword,
        businessName: businessNameController.text.trim(),
        address: businessAddressController.text.trim(),
        latitude: latitude?.toString(),
        longitude: longitude?.toString(),
        picture: imageProfile,
        commercialRegister: commercialRegister,
        taxCard: taxCard,
      );

      final formData = await adminModel.toFormData();
      final response = await _repo.registerAdmin(formData);

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (email.isNotEmpty) {
          await Bingo.mark("email", email);
        }
        final apiMessage = response.data['message'];
        emit(SignUpState.success(
          responseMessage: apiMessage is String && apiMessage.isNotEmpty ? apiMessage : 'signup_success_default',
        ));
      } else {
        final errorMsg = ApiErrorHandler.extractErrorMessage(response.data);
        emit(SignUpState.failure(errorMsg));
      }
    } on DioException catch (e) {
      final errorMessage = ApiErrorHandler.handleDioError(e);
      emit(SignUpState.failure(errorMessage));
    } catch (e) {
      emit(SignUpState.failure('error_unexpected'));
    }
  }
}