import 'package:bingo/bingo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop/core/shred/data/admin_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/shred/logic/location_helper.dart';
import '../../cart/data/models/cart_item_model.dart';
import '../data/checkout_repo.dart';
import '../data/models/checkout_model.dart';

part 'checkout_state.dart';
part 'checkout_cubit.freezed.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final CheckoutRepo _repo;

  CheckoutCubit(this._repo) : super(const CheckoutState.initial()) {
    _initDataFromBingo();
  }

  String currentAddress = "";
  double currentLatitude = 30.033333;
  double currentLongitude = 31.233334;
  String selectedPaymentMethod = "cash";

  void _initDataFromBingo() {
    final String? savedAddress = Bingo.call('delivery_address');
    final double? savedLat = Bingo.call('latitude');
    final double? savedLng = Bingo.call('longitude');

    if (savedAddress != null && savedAddress.isNotEmpty) {
      currentAddress = savedAddress;
      currentLatitude = savedLat ?? currentLatitude;
      currentLongitude = savedLng ?? currentLongitude;
      emit(CheckoutState.locationUpdated(currentAddress));
      return;
    }

    final clientData = Bingo.call("client_data");
    if (clientData is Map<String, dynamic>) {
      final model = ClientResponseModel.fromJson(clientData);
      currentAddress = model.address ?? "";
      currentLatitude = double.tryParse(model.latitude ?? '') ?? currentLatitude;
      currentLongitude = double.tryParse(model.longitude ?? '') ?? currentLongitude;
      emit(CheckoutState.locationUpdated(currentAddress));
    }
  }

  void changePaymentMethod(String method) {
    selectedPaymentMethod = method;
    emit(CheckoutState.paymentMethodChanged(method));
  }

  void initAddress(double lat, double lng, String address) {
    currentLatitude = lat;
    currentLongitude = lng;
    currentAddress = address;
    emit(CheckoutState.locationUpdated(currentAddress));
  }

  Future<void> updateLocationToCurrent() async {
    emit(const CheckoutState.loading());
    try {
      final position = await LocationHelper.getCurrentPosition();
      currentLatitude = position.latitude;
      currentLongitude = position.longitude;
      currentAddress = await LocationHelper.getAddressFromCoordinates(
        currentLatitude,
        currentLongitude,
      );

      emit(CheckoutState.locationUpdated(currentAddress));
    } catch (e) {
      emit(CheckoutState.failure(e.toString()));
    }
  }

  Future<void> createOrder({
    required List<CartItemModel> cartItems,
    required String address,
    required double latitude,
    required double longitude,
    required String paymentMethod,
  }) async {
    if (address.trim().isEmpty) {
      emit(CheckoutState.failure("val_address_required".tr()));
      return;
    }

    emit(const CheckoutState.loading());

    try {
      final response = await _repo.createOrder(
        productIds: cartItems.map((e) => e.productId).toList(),
        quantities: cartItems.map((e) => e.quantity).toList(),
        prices: cartItems.map((e) => e.product.price ?? 0).toList(),
        address: address,
        latitude: latitude,
        longitude: longitude,
        paymentMethod: paymentMethod,
      );

      emit(CheckoutState.success(response));
    } catch (e) {
      emit(CheckoutState.failure(e.toString()));
    }
  }
}