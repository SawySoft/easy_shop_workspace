import 'package:bingo/bingo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/shred/logic/location_helper.dart';
import '../data/profile_details_repo.dart';

part 'profile_details_state.dart';

part 'profile_details_cubit.freezed.dart';

class ProfileDetailsCubit extends Cubit<ProfileDetailsState> {
  final ProfileDetailsRepo _repo;

  ProfileDetailsCubit(this._repo) : super(const ProfileDetailsState.initial());

  Future<void> logout() async {
    emit(const ProfileDetailsState.loading());
    try {
      await _repo.logout();
    } catch (e) {}
    try {
      await Bingo.erase('token');
      emit(const ProfileDetailsState.success("logout_success_message"));
    } catch (e) {
      emit(ProfileDetailsState.failure(e.toString()));
    }
  }

  Future<void> getCurrentLocationAndSave() async {
    emit(const ProfileDetailsState.loading());
    try {
      Position position = await LocationHelper.getCurrentPosition();
      String address = await LocationHelper.getAddressFromCoordinates(position.latitude, position.longitude);

      await Bingo.mark('latitude', position.latitude);
      await Bingo.mark('longitude', position.longitude);
      await Bingo.mark('delivery_address', address);

      emit(ProfileDetailsState.locationSuccess(position.latitude, position.longitude, address));
    } catch (e) {
      emit(ProfileDetailsState.failure(e.toString()));
    }
  }
}
