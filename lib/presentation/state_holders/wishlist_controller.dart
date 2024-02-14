import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/wishlist_product_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utilities/urls.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class WishlistController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _msg = "Something Went Wrong!!";

  String get msg => _msg;

  WishlistProductModel _wishlistProductModel = WishlistProductModel();

  WishlistProductModel get wishlistProductModel => _wishlistProductModel;

  Future<bool> addToWishList(int productId) async {
    _inProgress = true;
    update();

    NetworkResponse networkResponse =
        await NetworkCaller().getRequest(Urls.addToWishList(productId));
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

  Future<bool> getWishList() async {
    _inProgress = true;
    update();

    NetworkResponse networkResponse =
        await NetworkCaller().getRequest(Urls.wishList);
    _inProgress = false;
    if (networkResponse.isSuccess &&
        networkResponse.responseData["msg"] == "success") {
      update();
      _wishlistProductModel =
          WishlistProductModel.fromJson(networkResponse.responseData);
      return true;
    } else {
      _msg = networkResponse.msg;
      update();
      return false;
    }
  }

  Future<bool> deleteFromWishList(int productId) async {
    _inProgress = true;
    update();

    NetworkResponse networkResponse =
        await NetworkCaller().getRequest(Urls.removeWishList(productId));
    _inProgress = false;
    if (networkResponse.isSuccess &&
        networkResponse.responseData["msg"] == "success") {
      update();
      getWishList();
      return true;
    } else {
      _msg = networkResponse.msg;
      update();
      return false;
    }
  }
}
