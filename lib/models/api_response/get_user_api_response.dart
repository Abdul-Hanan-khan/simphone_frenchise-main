import '../data_models/franchise.dart';

class GetUserApiResponse {
  GetUserApiResponse({
      bool? result, 
      String? message, 
      Franchise? franchise,}){
    _result = result;
    _message = message;
    _franchise = franchise;
}

  GetUserApiResponse.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    _franchise = json['franchise'] != null ? Franchise.fromJson(json['franchise']) : null;
  }
  bool? _result;
  String? _message;
  Franchise? _franchise;

  bool? get result => _result;
  String? get message => _message;
  Franchise? get franchise => _franchise;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    map['message'] = _message;
    if (_franchise != null) {
      map['franchise'] = _franchise?.toJson();
    }
    return map;
  }

}


class Inventory {
  Inventory({
      String? id, 
      String? deviceType, 
      String? name, 
      int? price, 
      List<String>? pics, 
      int? qty,}){
    _id = id;
    _deviceType = deviceType;
    _name = name;
    _price = price;
    _pics = pics;
    _qty = qty;
}

  Inventory.fromJson(dynamic json) {
    _id = json['_id'];
    _deviceType = json['deviceType'];
    _name = json['name'];
    _price = json['price'];
    _pics = json['pics'] != null ? json['pics'].cast<String>() : [];
    _qty = json['qty'];
  }
  String? _id;
  String? _deviceType;
  String? _name;
  int? _price;
  List<String>? _pics;
  int? _qty;

  String? get id => _id;
  String? get deviceType => _deviceType;
  String? get name => _name;
  int? get price => _price;
  List<String>? get pics => _pics;
  int? get qty => _qty;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['deviceType'] = _deviceType;
    map['name'] = _name;
    map['price'] = _price;
    map['pics'] = _pics;
    map['qty'] = _qty;
    return map;
  }

}

class Location {
  Location({
      String? type, 
      List<double>? coordinates,}){
    _type = type;
    _coordinates = coordinates;
}

  Location.fromJson(dynamic json) {
    _type = json['type'];
    _coordinates = json['coordinates'] != null ? json['coordinates'].cast<double>() : [];
  }
  String? _type;
  List<double>? _coordinates;

  String? get type => _type;
  List<double>? get coordinates => _coordinates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['coordinates'] = _coordinates;
    return map;
  }

}