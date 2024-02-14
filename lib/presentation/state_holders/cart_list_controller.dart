import 'package:crafty_bay/data/models/cart_item.dart';
import 'package:crafty_bay/data/models/cart_list_model.dart';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utilities/urls.dart';
import 'package:get/get.dart';

class CartListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _msg = "Something Went Wrong!!";

  String get msg => _msg;

  CartListModel _cartListModel = CartListModel();

  CartListModel get cartListModel => _cartListModel;

  final RxDouble _totalPrice = 0.0.obs;

  RxDouble get totalPrice => _totalPrice;

  Future<bool> getCartList() async {
    _inProgress = true;
    update();

    NetworkResponse networkResponse =
        await NetworkCaller().getRequest(Urls.cartList);
    _inProgress = false;
    if (networkResponse.isSuccess &&
        networkResponse.responseData["msg"] == "success") {
      update();
      _cartListModel = CartListModel.fromJson(networkResponse.responseData);
      _totalPrice.value = calculateTotalPrice;
      return true;
    } else {
      _msg = networkResponse.msg;
      update();
      return false;
    }
  }

  Future<bool> deleteFromCart(int productId) async {
    _inProgress = true;
    update();

    NetworkResponse networkResponse =
        await NetworkCaller().getRequest(Urls.deleteCartItem(productId));
    _inProgress = false;
    if (networkResponse.isSuccess &&
        networkResponse.responseData["msg"] == "success" &&
        networkResponse.responseData["data"] == 1) {
      _totalPrice.value = calculateTotalPrice;
      return true;
    } else {
      _msg = networkResponse.msg;
      return false;
    }
  }

  void updateQuantity(int id, int quantity) {
    _cartListModel.cartItemList
        ?.firstWhere((element) => element.id == id)
        .quantity = quantity;
    _totalPrice.value = calculateTotalPrice;
  }

  double get calculateTotalPrice {
    double total = 0;
    for (CartItem item in _cartListModel.cartItemList ?? []) {
      total +=
          (double.tryParse(item.product?.price ?? '0') ?? 0) * item.quantity;
    }
    return total;
  }
}
