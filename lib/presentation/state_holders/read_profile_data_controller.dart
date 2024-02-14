import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/profile.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utilities/urls.dart';
import 'package:get/get.dart';

class ReadProfileDataController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _msg = "Something Went Wrong!!";

  String get msg => _msg;

  bool _isProfileComplete = false;

  bool get isProfileComplete => _isProfileComplete;

  Profile _profile = Profile();

  Profile get profile => _profile;

  Future<bool> readProfileData(String token) async {
    _inProgress = true;
    update();

    NetworkResponse networkResponse =
        await NetworkCaller().getRequest(Urls.readProfile, token: token);
    _inProgress = false;
    if (networkResponse.isSuccess &&
        networkResponse.responseData["msg"] == "success") {
      update();

      dynamic profileData = networkResponse.responseData['data'] ?? [];

      if (profileData.isEmpty) {
        _isProfileComplete = true;
      } else {
        _profile = Profile.fromJson(profileData);
        _isProfileComplete = false;
      }
      return true;
    } else {
      _msg = networkResponse.msg;
      update();
      return false;
    }
  }
}
