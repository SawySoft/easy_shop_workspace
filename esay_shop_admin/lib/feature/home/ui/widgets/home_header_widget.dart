import 'package:bingo/bingo.dart';
import 'package:esay_shop_admin/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../app/theming/app_colors.dart';
import '../../../../core/shred/data/admin_response_model.dart';

class HomeHeaderWidget extends StatelessWidget {
  final String greeting;
  const HomeHeaderWidget({required this.greeting,super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final AdminResponseModel? currentAdmin = Bingo.call<AdminResponseModel>("admin_data");
    return Container(
      padding: const EdgeInsets.only(top: 55, left: 20, right: 20, bottom: 50),
      decoration: const BoxDecoration(
        color: AppColors.orange,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(currentAdmin?.pictureUrl ?? ''),
              ),
              12.hGap,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    greeting,
                    style: textTheme.headlineSmall,
                  ),
                   Text(
                    currentAdmin?.name ?? '',
                    style: textTheme.displayMedium!.copyWith(color: AppColors.white),
                  ),
                  Text(
                    currentAdmin?.businessName ?? '',
                    style: textTheme.headlineMedium,
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.notifications_none_rounded,
              color: AppColors.white,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}