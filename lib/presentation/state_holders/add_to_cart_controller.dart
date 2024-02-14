import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utilities/urls.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _msg = "Something Went Wrong!!";

  String get msg => _msg;

  Future<bool> addToCart(
      int productId, String color, String size, int quantity) async {
    _inProgress = true;
    update();

    Map<String, dynamic> inputParams = {
      "product_id": productId,
      "color": color,
      "size": size,
      "qty": quantity
    };

    NetworkResponse networkResponse = await NetworkCaller()
        .postRequest(Urls.addToCartList, body: inputParams);
    _inProgress = false;
    if (networkResponse.isSuccess &&
        networkResponse.responseData["msg"] == "success") {
      update();
      return true;
    } else {
      _msg = networkResponse.msg;
      update();
      return false;
    }
  }
}
