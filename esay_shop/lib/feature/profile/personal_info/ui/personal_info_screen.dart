import 'package:esay_shop/feature/profile/personal_info/ui/widgets/screens/desktop_personal_info_screen.dart';
import 'package:esay_shop/feature/profile/personal_info/ui/widgets/screens/mobile_personal_info_screen.dart';
import 'package:esay_shop/feature/profile/personal_info/ui/widgets/screens/tablet_personal_info_screen.dart';
import 'package:flutter/material.dart';


class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1024) {
          return const DesktopPersonalInfoScreen();
        } else if (constraints.maxWidth >= 600) {
          return const TabletPersonalInfoScreen();
        } else {
          return const MobilePersonalInfoScreen();
        }
      },
    );
  }
}
