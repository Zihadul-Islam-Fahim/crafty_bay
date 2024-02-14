import 'package:crafty_bay/data/models/product_details_data.dart';

class ProductDetailsModel {
  ProductDetailsModel({
    String? msg,
    List<ProductDetailsDataModel>? productDetailsDataList,
  }) {
    _msg = msg;
    _data = productDetailsDataList;
  }

  ProductDetailsModel.fromJson(dynamic json) {
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ProductDetailsDataModel.fromJson(v));
      });
    }
  }

  String? _msg;
  List<ProductDetailsDataModel>? _data;

  ProductDetailsModel copyWith({
    String? msg,
    List<ProductDetailsDataModel>? data,
  }) =>
      ProductDetailsModel(
        msg: msg ?? _msg,
        productDetailsDataList: data ?? _data,
      );

  String? get msg => _msg;

  List<ProductDetailsDataModel>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
