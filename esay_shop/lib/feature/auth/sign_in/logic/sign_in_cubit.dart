import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/shred/logic/client_form_controllers_mixin.dart';
import '../../../../core/shred/logic/api_error_handler.dart';
import '../../../../core/shred/logic/validators.dart';
import '../data/sign_in_repo.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

class SignInCubit extends Cubit<SignInState> with ClientFormControllersMixin {
  final SignInRepo _repo;

  SignInCubit(this._repo) : super(const SignInState.initial());

  void emitLoginStates() async {
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
        emit(SignInState.failure('error_unexpected'.tr(namedArgs: {'error': error.toString()})));
      }
    }
  }

  String? validateEmail(String? value) => Validators.validateEmail(value);

  String? validatePassword(String? value) => Validators.validatePassword(value);

  @override
  Future<void> close() {
    disposeClientControllers();
    return super.close();
  }
}