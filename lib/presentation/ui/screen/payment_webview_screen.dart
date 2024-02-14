import 'dart:developer';

import 'package:crafty_bay/presentation/ui/screen/main_bottom_nav_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebViewScreen extends StatefulWidget {
  const PaymentWebViewScreen({super.key, required this.url});

  final String url;

  @override
  State<PaymentWebViewScreen> createState() => _PaymentWebViewScreenState();
}

class _PaymentWebViewScreenState extends State<PaymentWebViewScreen> {
  late WebViewController webViewController;

  double inProgress = 0.0;
  bool isInProgress = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      try {
        webViewController = WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0x00000000))
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                setState(() {
                  inProgress = progress.toDouble() / 100;
                  isInProgress = inProgress == 1.0 ? false : true;
                });
              },
              onPageStarted: (String url) {
                log(url);
              },
              onPageFinished: (String url) {
                if (url.contains('mamount')) {} else {
                  if (url.contains('PaymentSuccess') ||
                      url.contains('success')) {
                    Get.defaultDialog(
                      title: 'Payment Success',
                      middleText: 'Thanks for payment',
                      textConfirm: 'Go Back',
                      confirmTextColor: Colors.white,
                      buttonColor: Colors.green,
                      onConfirm: () {
                        Get.to(() => const MainBottomNavScreen());
                      },
                    );
                  } else {
                    Get.defaultDialog(
                        title: 'Payment Failed',
                        middleText: 'Failed, Try again later!',
                        textConfirm: 'Go Back',
                        confirmTextColor: Colors.white,
                        onConfirm: () {
                          Get.to(() => const MainBottomNavScreen());
                        },
                        buttonColor: Colors.red);
                  }
                }
              },
              onWebResourceError: (WebResourceError error) {},
              onNavigationRequest: (NavigationRequest request) {
                if (request.url.startsWith('https://www.youtube.com/')) {
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(Uri.parse(widget.url));
      } catch (e) {
        Get.defaultDialog(
            title: 'Something Went wrong',
            middleText: e.toString(),
            textConfirm: 'Ok',
            confirmTextColor: Colors.white,
            onConfirm: () {
              Get.to(() => const MainBottomNavScreen());
            },
            buttonColor: Colors.red);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isInProgress
          ? Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: CircularPercentIndicator(
            radius: 60.0,
            lineWidth: 5.0,
            percent: inProgress,
            center: Text(
              "${(inProgress * 100).toInt()}%",
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w500),
            ),
            progressColor: AppColors.primaryColor,
          ),
        ),
      )
          : SafeArea(
        child: WebViewWidget(controller: webViewController),
      ),
    );
  }
}
