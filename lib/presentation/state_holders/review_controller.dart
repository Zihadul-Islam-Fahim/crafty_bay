import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/review_list_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utilities/urls.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _msg = "Something Went Wrong!!";

  String get msg => _msg;

  ReviewListModel _reviewListModel = ReviewListModel();

  ReviewListModel get reviewListModel => _reviewListModel;

  Future<bool> getReviewList(int productId) async {
    _inProgress = true;
    update();

    NetworkResponse networkResponse =
        await NetworkCaller().getRequest(Urls.reviewList(productId));
    _inProgress = false;
    if (networkResponse.isSuccess &&
        networkResponse.responseData["msg"] == "success") {
      update();

      _reviewListModel = ReviewListModel.fromJson(networkResponse.responseData);

      return true;
    } else {
      _msg = networkResponse.msg;
      update();
      return false;
    }
  }

  Future<bool> createReview(String rating, String des, String productId) async {
    _inProgress = true;
    update();

    Map<String, dynamic> inputParams = {
      "description": des,
      "product_id": productId,
      "rating": rating
    };
    NetworkResponse networkResponse =
        await NetworkCaller().postRequest(Urls.createReview, body: inputParams);
    if (networkResponse.isSuccess &&
        networkResponse.responseData["msg"] == "success") {
      _inProgress = false;
      update();

      return true;
    } else {
      _msg = networkResponse.msg;
      _inProgress = false;
      update();
      return false;
    }
  }
}
