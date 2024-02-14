
class ReviewListModel {
  ReviewListModel({
      String? msg, 
      List<Data>? reviewList,}){
    _msg = msg;
    _data = reviewList;
}

  ReviewListModel.fromJson(dynamic json) {
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
ReviewListModel copyWith({  String? msg,
  List<Data>? data,
}) => ReviewListModel(  msg: msg ?? _msg,
  reviewList: data ?? _data,
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
      String? description, 
      String? rating, 
      num? customerId, 
      num? productId, 
      String? createdAt, 
      String? updatedAt, 
      Profile? profile,}){
    _id = id;
    _description = description;
    _rating = rating;
    _customerId = customerId;
    _productId = productId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _profile = profile;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _description = json['description'];
    _rating = json['rating'];
    _customerId = json['customer_id'];
    _productId = json['product_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _profile = json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }
  num? _id;
  String? _description;
  String? _rating;
  num? _customerId;
  num? _productId;
  String? _createdAt;
  String? _updatedAt;
  Profile? _profile;
Data copyWith({  num? id,
  String? description,
  String? rating,
  num? customerId,
  num? productId,
  String? createdAt,
  String? updatedAt,
  Profile? profile,
}) => Data(  id: id ?? _id,
  description: description ?? _description,
  rating: rating ?? _rating,
  customerId: customerId ?? _customerId,
  productId: productId ?? _productId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  profile: profile ?? _profile,
);
  num? get id => _id;
  String? get description => _description;
  String? get rating => _rating;
  num? get customerId => _customerId;
  num? get productId => _productId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Profile? get profile => _profile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['description'] = _description;
    map['rating'] = _rating;
    map['customer_id'] = _customerId;
    map['product_id'] = _productId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_profile != null) {
      map['profile'] = _profile?.toJson();
    }
    return map;
  }

}

class Profile {
  Profile({
      num? id, 
      String? cusName,}){
    _id = id;
    _cusName = cusName;
}

  Profile.fromJson(dynamic json) {
    _id = json['id'];
    _cusName = json['cus_name'];
  }
  num? _id;
  String? _cusName;
Profile copyWith({  num? id,
  String? cusName,
}) => Profile(  id: id ?? _id,
  cusName: cusName ?? _cusName,
);
  num? get id => _id;
  String? get cusName => _cusName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['cus_name'] = _cusName;
    return map;
  }

}