import 'product_model.dart';

class ProductListModel {
  ProductListModel({
    String? msg,
    List<ProductModel>? data,
  }) {
    _msg = msg;
    _data = data;
  }

  ProductListModel.fromJson(dynamic json) {
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ProductModel.fromJson(v));
      });
    }
  }

  String? _msg;
  List<ProductModel>? _data;

  ProductListModel copyWith({
    String? msg,
    List<ProductModel>? data,
  }) =>
      ProductListModel(
        msg: msg ?? _msg,
        data: data ?? _data,
      );

  String? get msg => _msg;

  List<ProductModel>? get productList => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
