import 'package:crafty_bay/data/models/product_model.dart';

class ProductDetailsDataModel {
  ProductDetailsDataModel({
    num? id,
    String? img1,
    String? img2,
    String? img3,
    String? img4,
    String? des,
    String? color,
    String? size,
    num? productId,
    String? createdAt,
    String? updatedAt,
    ProductModel? product,
  }) {
    _id = id;
    _img1 = img1;
    _img2 = img2;
    _img3 = img3;
    _img4 = img4;
    _des = des;
    _color = color;
    _size = size;
    _productId = productId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _product = product;
  }

  ProductDetailsDataModel.fromJson(dynamic json) {
    _id = json['id'];
    _img1 = json['img1'];
    _img2 = json['img2'];
    _img3 = json['img3'];
    _img4 = json['img4'];
    _des = json['des'];
    _color = json['color'];
    _size = json['size'];
    _productId = json['product_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _product =
        json['product'] != null ? ProductModel.fromJson(json['product']) : null;
  }

  num? _id;
  String? _img1;
  String? _img2;
  String? _img3;
  String? _img4;
  String? _des;
  String? _color;
  String? _size;
  num? _productId;
  String? _createdAt;
  String? _updatedAt;
  ProductModel? _product;

  ProductDetailsDataModel copyWith({
    num? id,
    String? img1,
    String? img2,
    String? img3,
    String? img4,
    String? des,
    String? color,
    String? size,
    num? productId,
    String? createdAt,
    String? updatedAt,
    ProductModel? product,
  }) =>
      ProductDetailsDataModel(
        id: id ?? _id,
        img1: img1 ?? _img1,
        img2: img2 ?? _img2,
        img3: img3 ?? _img3,
        img4: img4 ?? _img4,
        des: des ?? _des,
        color: color ?? _color,
        size: size ?? _size,
        productId: productId ?? _productId,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        product: product ?? _product,
      );

  num? get id => _id;

  String? get img1 => _img1;

  String? get img2 => _img2;

  String? get img3 => _img3;

  String? get img4 => _img4;

  String? get des => _des;

  String? get color => _color;

  String? get size => _size;

  num? get productId => _productId;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  ProductModel? get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['img1'] = _img1;
    map['img2'] = _img2;
    map['img3'] = _img3;
    map['img4'] = _img4;
    map['des'] = _des;
    map['color'] = _color;
    map['size'] = _size;
    map['product_id'] = _productId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    return map;
  }
}
