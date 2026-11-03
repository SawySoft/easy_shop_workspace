import 'package:esay_shop_admin/feature/profile/profile_details/ui/widgets/screens/desktop_profile_screen.dart';
import 'package:esay_shop_admin/feature/profile/profile_details/ui/widgets/screens/mobile_profile_screen.dart';
import 'package:esay_shop_admin/feature/profile/profile_details/ui/widgets/screens/tablet_profile_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1024) {
          return const DesktopProfileScreen();
        } else if (constraints.maxWidth >= 600) {
          return const TabletProfileScreen();
        } else {
          return const MobileProfileScreen();
        }
      },
    );
  }
}