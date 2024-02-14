import 'package:crafty_bay/data/models/payment_method_wraper_model.dart';

class PaymentMethodListModel {
  PaymentMethodListModel({
    String? msg,
    List<PaymentMethodWrapper>? data,
  }) {
    _msg = msg;
    _data = data;
  }

  PaymentMethodListModel.fromJson(dynamic json) {
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(PaymentMethodWrapper.fromJson(v));
      });
    }
  }

  String? _msg;
  List<PaymentMethodWrapper>? _data;

  PaymentMethodListModel copyWith({
    String? msg,
    List<PaymentMethodWrapper>? data,
  }) =>
      PaymentMethodListModel(
        msg: msg ?? _msg,
        data: data ?? _data,
      );

  String? get msg => _msg;

  List<PaymentMethodWrapper>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
