import 'package:crafty_bay/data/models/brand_model.dart';

class BrandListModel {
  BrandListModel({
    String? msg,
    List<BrandModel>? data,
  }) {
    _msg = msg;
    _data = data;
  }

  BrandListModel.fromJson(dynamic json) {
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(BrandModel.fromJson(v));
      });
    }
  }

  String? _msg;
  List<BrandModel>? _data;

  BrandListModel copyWith({
    String? msg,
    List<BrandModel>? data,
  }) =>
      BrandListModel(
        msg: msg ?? _msg,
        data: data ?? _data,
      );

  String? get msg => _msg;

  List<BrandModel>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
