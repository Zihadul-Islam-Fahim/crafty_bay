import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/ui/screen/cart_screen.dart';
import 'package:crafty_bay/presentation/ui/screen/category_screen.dart';
import 'package:crafty_bay/presentation/ui/screen/home_screen.dart';
import 'package:crafty_bay/presentation/ui/screen/wishlist_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  int selectedIndex = 0;
  List<Widget> screens = const [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    WishListScreen()
  ];

  changeIndex(value) {
    if (value == 2 || value == 3) {
      if (Get.find<AuthController>().isTokenNotNull) {
        selectedIndex = value;
        update();
      } else {
        AuthController.goToLogIn();
      }
    } else {
      selectedIndex = value;
      update();
    }
  }
}
