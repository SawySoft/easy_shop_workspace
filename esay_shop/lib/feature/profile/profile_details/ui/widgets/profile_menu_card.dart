import 'package:easy_localization/easy_localization.dart';
import 'package:esay_shop/app/router/app_routes.dart';
import 'package:esay_shop/feature/profile/profile_details/ui/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../maps/ui/osm_map_screen.dart';
import '../../logic/profile_details_cubit.dart';

class ProfileMenuCard extends StatelessWidget {
  const ProfileMenuCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Material(
          color: Colors.transparent,
          child: Column(
            children: [
              ProfileMenuItem(
                icon: Icons.person_outline,
                title: "personal_info_menu".tr(),
                onTap: () => Navigator.of(context).pushNamed(AppRoutes.personalInfo.route),
              ),
              BlocListener<ProfileDetailsCubit, ProfileDetailsState>(
                listener: (context, state) {
                  state.whenOrNull(
                    locationSuccess: (lat, lng, address) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapScreen(
                            latitude: lat,
                            longitude: lng,
                            storeName: address,
                          ),
                        ),
                      );
                    },
                    failure: (message) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(message)),
                      );
                    },
                  );
                },
                child: ProfileMenuItem(
                  icon: Icons.location_on_outlined,
                  title: "delivery_address_menu".tr(),
                  onTap: () {
                    context.read<ProfileDetailsCubit>().getCurrentLocationAndSave();
                  },
                ),
              ),
              ProfileMenuItem(
                icon: Icons.card_giftcard,
                title: "my_orders_menu".tr(),
                onTap: () => Navigator.of(context).pushNamed(AppRoutes.orders.route),
              ),
              ProfileMenuItem(
                icon: Icons.favorite_border,
                title: "favorites_menu".tr(),
                onTap: () => Navigator.of(context).pushNamed(AppRoutes.faves.route),
              ),
              ProfileMenuItem(
                icon: Icons.edit_outlined,
                title: "edit_profile_menu".tr(),
                onTap: () => Navigator.of(context).pushNamed(AppRoutes.editProfile.route),
                showDivider: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}