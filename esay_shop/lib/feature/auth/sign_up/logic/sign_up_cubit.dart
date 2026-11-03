import 'dart:io';

import 'package:dio/dio.dart';
import 'package:bingo/bingo.dart';
import 'package:esay_shop/feature/auth/sign_up/logic/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shred/logic/client_form_controllers_mixin.dart';
import '../../../../core/shred/logic/api_error_handler.dart';
import '../../../../core/shred/logic/location_helper.dart';
import '../../../../core/shred/logic/validators.dart';
import '../data/sign_up_repo.dart';
import '../data/models/client_request_model.dart';

class SignUpCubit extends Cubit<SignUpState> with ClientFormControllersMixin  {
  final SignUpRepo _repo;

  SignUpCubit(this._repo) : super(const SignUpState.initial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  File? imageProfile;
  double? latitude;
  double? longitude;
  String? address;

  void setProfileImage(File file) {
    imageProfile = file;
    emit(const SignUpState.initial());
  }

  Future<void> getCurrentLocation() async {
    emit(const SignUpState.locationLoading());
    try {
      final pos = await LocationHelper.getCurrentPosition();
      latitude = pos.latitude;
      longitude = pos.longitude;
      address = await LocationHelper.getAddressFromCoordinates(latitude!, longitude!);
      emit(SignUpState.locationSuccess(address!));
    } catch (e) {
      emit(SignUpState.locationFailure(e.toString()));
    }
  }

  void removeLocation() {
    latitude = null;
    longitude = null;
    address = null;
    emit(const SignUpState.initial());
  }

  String? validateName(String? value) => Validators.validateName(value);
  String? validateEmail(String? value) => Validators.validateEmail(value);
  String? validatePhone(String? value) => Validators.validatePhone(value);
  String? validatePassword(String? value) => Validators.validatePassword(value);
  String? validateConfirmPassword(String? value) {
    return Validators.validateConfirmPassword(value, passwordController.text);
  }
  String? validateOtp(String? value) => Validators.validateOtp(value);

  Future<void> register() async {
    if (passwordController.text.trim() != confirmPasswordController.text.trim()) {
      emit(const SignUpState.failure('كلمة المرور غير مطابقة'));
      return;
    }

    emit(const SignUpState.loading());

    try {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      final confirmPassword = confirmPasswordController.text.trim();
      final phone = phoneController.text.trim();

      ClientRequestModel clientModel = ClientRequestModel(
        name: nameController.text.trim(),
        email: email,
        phone: "+2$phone",
        password: password,
        passwordConfirmation: confirmPassword,
        address: addressController.text.trim(),
        latitude: latitude?.toString(),
        longitude: longitude?.toString(),
        picture: imageProfile,
      );

      final formData = await clientModel.toFormData();
      final response = await _repo.registerClient(formData);

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (email.isNotEmpty) {
          await Bingo.mark("email", email);
        }

        emit(SignUpState.success(
          responseMessage: response.data['message'] ?? 'تم إنشاء الحساب بنجاح',
        ));
      } else {
        final errorMsg = ApiErrorHandler.extractErrorMessage(response.data);
        emit(SignUpState.failure(errorMsg));
      }
    } on DioException catch (e) {
      final errorMessage = ApiErrorHandler.handleDioError(e);
      emit(SignUpState.failure(errorMessage));
    } catch (e) {
      emit(SignUpState.failure('حدث خطأ غير متوقع: ${e.toString()}'));
    }
  }

  @override
  Future<void> close() {
    disposeClientControllers();
    return super.close();
  }
}