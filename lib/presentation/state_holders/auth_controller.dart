import 'dart:convert';
import 'package:crafty_bay/data/models/profile.dart';
import 'package:crafty_bay/presentation/ui/screen/auth/verify_email_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  static String? token;
  static Profile? profile;

  Future<void> saveUserDetails(String t, Profile p) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', t);
    await sharedPreferences.setString('userInfo', jsonEncode(p.toJson()));
    token = t;
    profile = p;
  }

  Future<void> initialize() async {
    token = await _getToken();
    await _getProfile();
  }

  Future<bool> isLoggedIn() async {
    await initialize();
    return token != null;
  }

  bool get isTokenNotNull => token != null;

  Future<String?> _getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('token');
  }

  Future<Profile?> _getProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? strProfile = sharedPreferences.getString('userInfo');
    if (strProfile == null) {
      return null;
    } else {
      return Profile.fromJson(jsonDecode(strProfile));
    }
  }

  static Future<void> clearAuthData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    token = null ;
  }

  static Future<void> goToLogIn() async{
    await clearAuthData();
    Get.to(const VerifyEmailScreen());
  }
}
