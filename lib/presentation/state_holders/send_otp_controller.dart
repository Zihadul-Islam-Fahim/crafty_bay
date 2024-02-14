import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utilities/urls.dart';
import 'package:get/get.dart';

class SendOtpController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;
  String _message = '';

  String get message => _message;

  Future<bool> sendOtp(String email) async {
    _inProgress = true;
    update();

    final NetworkResponse networkResponse =
        await NetworkCaller().getRequest(Urls.sendOtpUrl(email));
    _inProgress = false;

    if (networkResponse.isSuccess) {
      update();

      return true;
    } else {
      _message = networkResponse.msg;
      update();
      return false;
    }
  }
}
