import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../app/router/app_routes.dart';

class PaymentWebViewScreen extends StatelessWidget {
  final String paymentUrl;

  PaymentWebViewScreen({super.key, required this.paymentUrl}) {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            if (url.contains('success') || url.contains('callback')) {
              // أكواد التعامل مع نجاح الدفع والرجوع
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(paymentUrl));
  }

  late final WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('payment_screen_title'.tr()),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.dashboard.route, (route) => false),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}