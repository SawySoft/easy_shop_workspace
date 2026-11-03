import 'dart:io';

import 'package:bingo/bingo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../../../core/shred/data/admin_response_model.dart';
import '../../../../core/shred/logic/client_form_controllers_mixin.dart';
import '../../../../core/shred/logic/api_error_handler.dart';
import '../../../../core/shred/logic/location_helper.dart';
import '../../../../core/shred/logic/validators.dart';
import '../data/edit_profile_repo.dart';
import 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> with ClientFormControllersMixin {
  final EditProfileRepo _profileRepo;

  EditProfileCubit(this._profileRepo) : super(const EditProfileState.initial()) {
    loadClientDataFromBingo();
  }

  File? profileImage;
  double? latitude;
  double? longitude;
  String? address;

  String? validateName(String? value) => Validators.validateName(value);

  String? validateEmail(String? value) => Validators.validateEmail(value);

  String? validatePhone(String? value) => Validators.validatePhone(value);

  String? validatePassword(String? value) => Validators.validatePassword(value);

  String? validateOtp(String? value) => Validators.validateOtp(value);

  void loadClientDataFromBingo() {
    final cachedData = Bingo.call<ClientResponseModel>("client_data");
    if (cachedData != null) {
      initWithClientData(cachedData);
    }
  }

  void initWithClientData(ClientResponseModel? client) {
    if (client == null) return;
    nameController.text = client.name ?? '';
    emailController.text = client.email ?? '';
    phoneController.text = client.phone ?? '';
    addressController.text = client.address ?? '';

    latitude = double.tryParse(client.latitude.toString());
    longitude = double.tryParse(client.longitude.toString());
    address = client.address;
  }

  void setProfileImage(File file) {
    profileImage = file;
    emit(const EditProfileState.initial());
  }

  Future<void> getCurrentLocation() async {
    emit(const EditProfileState.locationLoading());
    try {
      final pos = await LocationHelper.getCurrentPosition();
      latitude = pos.latitude;
      longitude = pos.longitude;
      address = await LocationHelper.getAddressFromCoordinates(latitude!, longitude!);

      addressController.text = address ?? '';

      emit(EditProfileState.locationSuccess(address!));
    } catch (e) {
      emit(EditProfileState.locationFailure(e.toString()));
    }
  }

  void removeLocation() {
    latitude = null;
    longitude = null;
    address = null;
    addressController.clear();
    emit(const EditProfileState.initial());
  }

  Future<void> updateClientProfile() async {
    emit(const EditProfileState.loading());
    try {
      final Map<String, dynamic> data = {
        '_method': 'PUT',
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'phone': phoneController.text.trim(),
        'address': addressController.text.trim(),
        if (latitude != null) 'latitude': latitude.toString(),
        if (longitude != null) 'longitude': longitude.toString(),
      };

      if (profileImage != null) {
        data['picture'] = await MultipartFile.fromFile(
          profileImage!.path,
          filename: profileImage!.path.split('/').last,
        );
      }

      final response = await _profileRepo.updateProfile(FormData.fromMap(data));

      Bingo.mark("client_data", response.data['data']);

      emit(const EditProfileState.success(message: 'profile_updated_success'));
    } on DioException catch (e) {
      emit(EditProfileState.failure(ApiErrorHandler.handleDioError(e)));
    } catch (e) {
      emit(EditProfileState.failure(e.toString()));
    }
  }

  @override
  Future<void> close() {
    disposeClientControllers();
    return super.close();
  }
}