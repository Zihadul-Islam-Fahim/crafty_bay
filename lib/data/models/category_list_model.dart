import 'package:crafty_bay/data/models/category_model.dart';

class CategoryListModel {
  CategoryListModel({
    String? msg,
    List<Category>? data,
  }) {
    _msg = msg;
    _data = data;
  }

  CategoryListModel.fromJson(dynamic json) {
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Category.fromJson(v));
      });
    }
  }

  String? _msg;
  List<Category>? _data;

  CategoryListModel copyWith({
    String? msg,
    List<Category>? data,
  }) =>
      CategoryListModel(
        msg: msg ?? _msg,
        data: data ?? _data,
      );

  String? get msg => _msg;

  List<Category>? get categoryList => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
