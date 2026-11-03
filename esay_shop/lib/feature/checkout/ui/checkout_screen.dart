import 'package:esay_shop/feature/checkout/ui/widgets/screens/desktop_checkout_screen.dart';
import 'package:esay_shop/feature/checkout/ui/widgets/screens/mobile_checkout_screen.dart';
import 'package:esay_shop/feature/checkout/ui/widgets/screens/tablet_checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/dependency_injection/dependency_injection.dart';
import '../data/models/checkout_arguments_model.dart';
import '../logic/checkout_cubit.dart';

class CheckoutScreen extends StatelessWidget {
  final CheckoutArgumentsModel args;

  const CheckoutScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => DependencyInjection.getIt<CheckoutCubit>()),],
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1024) {
            return  DesktopCheckoutScreen(args: args,);
          } else if (constraints.maxWidth >= 600) {
            return  TabletCheckoutScreen(args: args,);
          } else {
            return  MobileCheckoutScreen(args: args,);
          }
        },
      ),
    );
  }
}