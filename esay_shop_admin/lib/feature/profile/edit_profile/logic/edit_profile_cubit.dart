import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:bingo/bingo.dart';

import '../../../../core/shred/data/admin_response_model.dart';
import '../../../../core/shred/logic/admin_form_controllers_mixin.dart';
import '../../../../core/shred/logic/api_error_handler.dart';
import '../../../../core/shred/logic/location_helper.dart';
import '../../../../core/shred/logic/validators.dart';
import '../data/edit_profile_repo.dart';
import 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> with AdminFormControllersMixin {
  final EditProfileRepo _profileRepo;

  EditProfileCubit(this._profileRepo) : super(const EditProfileState.initial()) {
    loadAdminDataFromBingo();
  }

  File? profileImage;
  File? commercialRegister;
  File? taxCard;
  double? latitude;
  double? longitude;


  String? validateName(String? value) => Validators.validateName(value);

  String? validateEmail(String? value) => Validators.validateEmail(value);

  String? validatePhone(String? value) => Validators.validatePhone(value);

  String? validateNationalId(String? value) => Validators.validateNationalId(value);

  String? validatePassword(String? value) => Validators.validatePassword(value);


  String? validateOtp(String? value) => Validators.validateOtp(value);


  void loadAdminDataFromBingo() {
    final cachedData = Bingo.call<AdminResponseModel>("admin_data");
    if (cachedData != null) {
      initWithAdminData(cachedData);
    }
  }

  void initWithAdminData(AdminResponseModel? admin) {
    if (admin == null) return;
    nameController.text = admin.name ?? '';
    emailController.text = admin.email ?? '';
    phoneController.text = admin.phone ?? '';
    nationalIdController.text = admin.nationalId ?? '';
    businessNameController.text = admin.businessName ?? '';
    businessAddressController.text = admin.address ?? '';
  }

  void setProfileImage(File file) { profileImage = file; emit(const EditProfileState.initial()); }
  void setCommercialRegister(File file) { commercialRegister = file; emit(const EditProfileState.initial()); }
  void setTaxCard(File file) { taxCard = file; emit(const EditProfileState.initial()); }

  Future<void> getCurrentLocation() async {
    emit(const EditProfileState.locationLoading());
    try {
      final pos = await LocationHelper.getCurrentPosition();
      latitude = pos.latitude;
      longitude = pos.longitude;
      final address = await LocationHelper.getAddressFromCoordinates(latitude!, longitude!);
      emit(EditProfileState.locationSuccess(address));
    } catch (e) {
      emit(EditProfileState.locationFailure(e.toString()));
    }
  }

  void removeLocation() {
    latitude = null;
    longitude = null;
    emit(const EditProfileState.initial());
  }

  Future<void> updateAdminProfile() async {
    emit(const EditProfileState.loading());
    try {
      final Map<String, dynamic> data = {
        '_method': 'PUT',
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'phone': phoneController.text.trim(),
        'national_id': nationalIdController.text.trim(),
        'business_name': businessNameController.text.trim(),
        'address': businessAddressController.text.trim(),
        if (latitude != null) 'latitude': latitude,
        if (longitude != null) 'longitude': longitude,
      };

      if (profileImage != null) {
        data['picture'] = await MultipartFile.fromFile(
          profileImage!.path,
          filename: profileImage!.path.split('/').last,
        );
      }
      if (commercialRegister != null) {
        data['commercial_register'] = await MultipartFile.fromFile(
          commercialRegister!.path,
          filename: commercialRegister!.path.split('/').last,
        );
      }
      if (taxCard != null) {
        data['tax_card'] = await MultipartFile.fromFile(
          taxCard!.path,
          filename: taxCard!.path.split('/').last,
        );
      }

      final response = await _profileRepo.updateProfile(FormData.fromMap(data));

      Bingo.mark("admin_data", response.data['data']);

      emit(const EditProfileState.success(message: 'edit_profile_success_message'));
    } on DioException catch (e) {
      emit(EditProfileState.failure(ApiErrorHandler.handleDioError(e)));
    } catch (e) {
      emit(EditProfileState.failure(e.toString()));
    }
  }

  @override
  Future<void> close() {
    disposeAdminControllers();
    return super.close();
  }
}