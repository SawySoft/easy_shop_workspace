import 'package:easy_localization/easy_localization.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationHelper {
  static Future<Position> getCurrentPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) throw 'loc_service_disabled'.tr();

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) throw 'loc_permission_denied'.tr();
    }
    if (permission == LocationPermission.deniedForever) {
      throw 'loc_permission_denied_forever'.tr();
    }
    return await Geolocator.getCurrentPosition();
  }

  static Future<String> getAddressFromCoordinates(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await Geocoding().placemarkFromCoordinates(lat, lng);
      if (placemarks.isNotEmpty) {
        final p = placemarks.first;
        final city = p.locality ?? p.administrativeArea ?? '';
        final country = p.country ?? '';
        return city.isNotEmpty ? '$city, $country' : 'loc_determined'.tr();
      }
    } catch (_) {}
    return 'loc_determined_success'.tr();
  }
}