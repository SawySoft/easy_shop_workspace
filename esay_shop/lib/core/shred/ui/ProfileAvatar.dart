import 'package:flutter/material.dart';
import '../../../app/theming/app_colors.dart';
import '../data/admin_response_model.dart';

class ProfileAvatar extends StatelessWidget {
  final ClientResponseModel? clientData;
  final double size;
  final VoidCallback? onTap;

  const ProfileAvatar({
    required this.size,
    super.key,
    this.clientData,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasImage = clientData?.pictureUrl != null &&
        clientData!.pictureUrl!.trim().isNotEmpty;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.orange,
          image: hasImage
              ? DecorationImage(
            image: NetworkImage(clientData!.pictureUrl!),
            fit: BoxFit.cover,
          )
              : null,
        ),
        alignment: Alignment.center,
        child: hasImage
            ? null
            : Text(
          getInitials(clientData?.name ?? ''),
          style: TextStyle(
            color: AppColors.white,
            fontSize: size * 0.4,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

  String getInitials(String name) {
    List<String> names = name.trim().split(" ");
    if (names.length >= 2) {
      return "${names[0][0]}${names[1][0]}".toUpperCase();
    } else if (names.isNotEmpty && names[0].isNotEmpty) {
      return names[0][0].toUpperCase();
    }
    return "";
  }
