class PaymentMethod {
  PaymentMethod({
    String? name,
    String? type,
    String? logo,
    String? gw,
    String? rFlag,
    String? redirectGatewayURL,}){
    _name = name;
    _type = type;
    _logo = logo;
    _gw = gw;
    _rFlag = rFlag;
    _redirectGatewayURL = redirectGatewayURL;
  }

  PaymentMethod.fromJson(dynamic json) {
    _name = json['name'];
    _type = json['type'];
    _logo = json['logo'];
    _gw = json['gw'];
    _rFlag = json['r_flag'];
    _redirectGatewayURL = json['redirectGatewayURL'];
  }
  String? _name;
  String? _type;
  String? _logo;
  String? _gw;
  String? _rFlag;
  String? _redirectGatewayURL;
  PaymentMethod copyWith({  String? name,
    String? type,
    String? logo,
    String? gw,
    String? rFlag,
    String? redirectGatewayURL,
  }) => PaymentMethod(  name: name ?? _name,
    type: type ?? _type,
    logo: logo ?? _logo,
    gw: gw ?? _gw,
    rFlag: rFlag ?? _rFlag,
    redirectGatewayURL: redirectGatewayURL ?? _redirectGatewayURL,
  );
  String? get name => _name;
  String? get type => _type;
  String? get logo => _logo;
  String? get gw => _gw;
  String? get rFlag => _rFlag;
  String? get redirectGatewayURL => _redirectGatewayURL;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['type'] = _type;
    map['logo'] = _logo;
    map['gw'] = _gw;
    map['r_flag'] = _rFlag;
    map['redirectGatewayURL'] = _redirectGatewayURL;
    return map;
  }

}