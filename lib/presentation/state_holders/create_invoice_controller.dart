import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/payment_method_list_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utilities/urls.dart';
import 'package:get/get.dart';

class CreateInvoiceController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _msg = "Something Went Wrong!!";

  String get msg => _msg;

  PaymentMethodListModel _paymentMethodListModel = PaymentMethodListModel();

  PaymentMethodListModel get paymentMethodListModel => _paymentMethodListModel;

  Future<bool> createInvoice() async {
    _inProgress = true;
    update();
    final NetworkResponse networkResponse =
        await NetworkCaller().getRequest(Urls.createInvoice);
    _inProgress = false;
    update();
    if (networkResponse.isSuccess) {
      _paymentMethodListModel =
          PaymentMethodListModel.fromJson(networkResponse.responseData);
      return true;
    } else {
      _msg = networkResponse.msg;
      return false;
    }
  }
}
