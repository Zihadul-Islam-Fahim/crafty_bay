import 'package:crafty_bay/data/models/banner_model.dart';

class BannerListModel {
  String? msg;
  List<BannerItem>? bannerList;

  BannerListModel({this.bannerList, this.msg}) {
    _msg = msg;
    _bannerList = bannerList;
  }

  BannerListModel.fromJson(dynamic json) {
    _msg = json['msg'];
    if (json['data'] != null) {
      _bannerList = [];
      json['data'].forEach((v) {
        _bannerList?.add(BannerItem.fromJson(v));
      });
    }
  }

  String? _msg;
  List<BannerItem>? _bannerList;

  BannerListModel copyWith({
    String? msg,
    List<BannerItem>? data,
  }) =>
      BannerListModel(
        msg: msg ?? _msg,
        bannerList: data ?? _bannerList,
      );

  String? get message => _msg;

  List<BannerItem>? get data => _bannerList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    if (_bannerList != null) {
      map['data'] = _bannerList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
