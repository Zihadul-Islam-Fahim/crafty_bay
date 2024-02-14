import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/product_list_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utilities/urls.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NewProductController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _msg = "Something Went Wrong!!";

  String get msg => _msg;

  ProductListModel _productListModel = ProductListModel();

  ProductListModel get productListModel => _productListModel;

  Future<bool> getNewProductList() async {
    _inProgress = true;
    update();

    NetworkResponse networkResponse =
        await NetworkCaller().getRequest(Urls.newProductList);
    _inProgress = false;
    if (networkResponse.isSuccess &&
        networkResponse.responseData["msg"] == "success") {
      update();
      _productListModel =
          ProductListModel.fromJson(networkResponse.responseData);
      return true;
    } else {
      _msg = networkResponse.msg;
      update();
      return false;
    }
  }
}
