import 'package:crafty_bay/controller_binder.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presentation/ui/screen/auth/splash_screen.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppThemeData.lightTheme,
      home: const SplashScreen(),
      initialBinding: ControllerBinder(),
    );
  }
}
