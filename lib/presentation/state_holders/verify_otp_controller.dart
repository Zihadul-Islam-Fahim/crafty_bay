import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utilities/urls.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/read_profile_data_controller.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;
  String _msg = "Something Went Wrong!!";

  String get msg => _msg;
  bool _shouldNavigateCompleteProfile = true;

  bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;
  String _token = '';

  String get token => _token;

  Future<bool> verifyOTP(String email, String otp) async {
    _inProgress = true;
    update();

    NetworkResponse networkResponse =
        await NetworkCaller().getRequest(Urls.verifyOtp(email, otp));
    _inProgress = false;
    if (networkResponse.isSuccess &&
        networkResponse.responseData["msg"] == "success") {
      _msg = networkResponse.msg;
      update();
      _token = networkResponse.responseData['data'];
      final result =
          await Get.find<ReadProfileDataController>().readProfileData(token);
      if (result) {
        _shouldNavigateCompleteProfile =
            Get.find<ReadProfileDataController>().isProfileComplete;
        if (_shouldNavigateCompleteProfile == false) {
          await Get.find<AuthController>().saveUserDetails(
              token, Get.find<ReadProfileDataController>().profile);
        }
      } else {
        _shouldNavigateCompleteProfile =
            Get.find<ReadProfileDataController>().isProfileComplete;
      }
      return true;
    } else {
      _msg = networkResponse.msg;
      update();
      return false;
    }
  }
}
