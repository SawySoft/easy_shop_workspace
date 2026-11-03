import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../app/theming/app_colors.dart';

class MapScreen extends StatelessWidget {
  final double latitude;
  final double longitude;
  final String storeName;

  const MapScreen({
    super.key,
    required this.latitude,
    required this.longitude,
    this.storeName = 'Easy Shop Location',
  });

  @override
  Widget build(BuildContext context) {
    final LatLng targetLocation = LatLng(latitude, longitude);

    return Scaffold(
      appBar: AppBar(
        title: Text(storeName),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: targetLocation,
          initialZoom: 15.0,
          maxZoom: 18.0,
          minZoom: 5.0,
        ),
        children: [
          // طبقة خريطة الشوارع
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.easyshop.app',
          ),
          // طبقة الدبوس
          MarkerLayer(
            markers: [
              Marker(
                point: targetLocation,
                width: 80.0,
                height: 80.0,
                child:  Icon(
                  Icons.location_pin,
                  color: AppColors.red,
                  size: 40.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}