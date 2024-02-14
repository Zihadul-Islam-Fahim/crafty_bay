
class Profile {
  Profile({
    String? email,
    String? firstName,
    String? lastName,
    String? mobile,
    String? city,
    String? shippingAddress,
    String? updatedAt,
    String? createdAt,
    num? id,
  }) {
    _email = email;
    _firstName = firstName;
    _lastName = lastName;
    _mobile = mobile;
    _city = city;
    _shippingAddress = shippingAddress;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
  }

  Profile.fromJson(dynamic json) {
    _email = json['email'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _mobile = json['mobile'];
    _city = json['city'];
    _shippingAddress = json['shippingAddress'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }

  String? _email;
  String? _firstName;
  String? _lastName;
  String? _mobile;
  String? _city;
  String? _shippingAddress;
  String? _updatedAt;
  String? _createdAt;
  num? _id;

  Profile copyWith({
    String? email,
    String? firstName,
    String? lastName,
    String? mobile,
    String? city,
    String? shippingAddress,
    String? updatedAt,
    String? createdAt,
    num? id,
  }) =>
      Profile(
        email: email ?? _email,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        mobile: mobile ?? _mobile,
        city: city ?? _city,
        shippingAddress: shippingAddress ?? _shippingAddress,
        updatedAt: updatedAt ?? _updatedAt,
        createdAt: createdAt ?? _createdAt,
        id: id ?? _id,
      );

  String? get email => _email;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get mobile => _mobile;

  String? get city => _city;

  String? get shippingAddress => _shippingAddress;

  String? get updatedAt => _updatedAt;

  String? get createdAt => _createdAt;

  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['mobile'] = _mobile;
    map['city'] = _city;
    map['shippingAddress'] = _shippingAddress;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }
}
