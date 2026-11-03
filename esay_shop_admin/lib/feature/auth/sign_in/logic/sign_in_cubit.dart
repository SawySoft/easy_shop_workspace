import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/shred/logic/admin_form_controllers_mixin.dart';
import '../../../../core/shred/logic/api_error_handler.dart';
import '../../../../core/shred/logic/validators.dart';
import '../data/sign_in_repo.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

class SignInCubit extends Cubit<SignInState> with AdminFormControllersMixin {
  final SignInRepo _repo;

  static final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  SignInCubit(this._repo) : super(const SignInState.initial());

  void emitLoginStates() async {
    if (!signInFormKey.currentState!.validate()) return;

    emit(const SignInState.loading());

    final email = emailController.text.trim();

    try {
      await _repo.login(
        email: email,
        password: passwordController.text,
      );
      emit(SignInState.success(email));
    } catch (error) {
      if (error is DioException) {
        final errorMessage = ApiErrorHandler.handleDioError(error);
        final lowerMsg = errorMessage.toLowerCase();

        if (lowerMsg.contains('verify') ||
            lowerMsg.contains('unverified') ||
            lowerMsg.contains('active') ||
            error.response?.statusCode == 403) {
          emit(SignInState.success(email));
          return;
        }

        emit(SignInState.failure(errorMessage));
      } else {
        emit(SignInState.failure('error_unexpected'));
      }
    }
  }

  String? validateEmail(String? value) => Validators.validateEmail(value);

  String? validatePassword(String? value) => Validators.validatePassword(value);

  @override
  Future<void> close() {
    disposeAdminControllers();
    return super.close();
  }
}