import 'package:crafty_bay/data/models/product_model.dart';

class WishlistProductModel {
  WishlistProductModel({
    String? msg,
    List<Data>? data,
  }) {
    _msg = msg;
    _data = data;
  }

  WishlistProductModel.fromJson(dynamic json) {
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  String? _msg;
  List<Data>? _data;

  WishlistProductModel copyWith({
    String? msg,
    List<Data>? data,
  }) =>
      WishlistProductModel(
        msg: msg ?? _msg,
        data: data ?? _data,
      );

  String? get msg => _msg;

  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    num? id,
    num? productId,
    num? userId,
    String? createdAt,
    String? updatedAt,
    ProductModel? product,
  }) {
    _id = id;
    _productId = productId;
    _userId = userId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _product = product;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _productId = json['product_id'];
    _userId = json['user_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _product =
        json['product'] != null ? ProductModel.fromJson(json['product']) : null;
  }

  num? _id;
  num? _productId;
  num? _userId;
  String? _createdAt;
  String? _updatedAt;
  ProductModel? _product;

  Data copyWith({
    num? id,
    num? productId,
    num? userId,
    String? createdAt,
    String? updatedAt,
    ProductModel? product,
  }) =>
      Data(
        id: id ?? _id,
        productId: productId ?? _productId,
        userId: userId ?? _userId,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        product: product ?? _product,
      );

  num? get id => _id;

  num? get productId => _productId;

  num? get userId => _userId;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  ProductModel? get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_id'] = _productId;
    map['user_id'] = _userId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    return map;
  }
}
