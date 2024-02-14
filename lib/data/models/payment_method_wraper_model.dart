import 'package:crafty_bay/data/models/payment_method_model.dart';

class PaymentMethodWrapper {
  PaymentMethodWrapper({
    List<PaymentMethod>? paymentMethodList,
    num? payable,
    num? vat,
    num? total,}){
    _paymentMethod = paymentMethodList;
    _payable = payable;
    _vat = vat;
    _total = total;
  }

  PaymentMethodWrapper.fromJson(dynamic json) {
    if (json['paymentMethod'] != null) {
      _paymentMethod = [];
      json['paymentMethod'].forEach((v) {
        _paymentMethod?.add(PaymentMethod.fromJson(v));
      });
    }
    _payable = json['payable'];
    _vat = json['vat'];
    _total = json['total'];
  }
  List<PaymentMethod>? _paymentMethod;
  num? _payable;
  num? _vat;
  num? _total;
  PaymentMethodWrapper copyWith({  List<PaymentMethod>? paymentMethod,
    num? payable,
    num? vat,
    num? total,
  }) => PaymentMethodWrapper(  paymentMethodList: paymentMethod ?? _paymentMethod,
    payable: payable ?? _payable,
    vat: vat ?? _vat,
    total: total ?? _total,
  );
  List<PaymentMethod>? get paymentMethod => _paymentMethod;
  num? get payable => _payable;
  num? get vat => _vat;
  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_paymentMethod != null) {
      map['paymentMethod'] = _paymentMethod?.map((v) => v.toJson()).toList();
    }
    map['payable'] = _payable;
    map['vat'] = _vat;
    map['total'] = _total;
    return map;
  }

}