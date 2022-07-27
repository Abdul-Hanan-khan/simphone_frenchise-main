class AddDeviceApiResponse {
  AddDeviceApiResponse({
      bool? result, 
      String? message, 
      User? user,}){
    _result = result;
    _message = message;
    _user = user;
}

  AddDeviceApiResponse.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  bool? _result;
  String? _message;
  User? _user;

  bool? get result => _result;
  String? get message => _message;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    map['message'] = _message;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

class User {
  User({
      String? id, 
      String? name, 
      int? cnic, 
      String? email, 
      int? phone, 
      String? role, 
      String? status, 
      String? area, 
      List<Inventory>? inventory, 
      String? avatar, 
      int? v,}){
    _id = id;
    _name = name;
    _cnic = cnic;
    _email = email;
    _phone = phone;
    _role = role;
    _status = status;
    _area = area;
    _inventory = inventory;
    _avatar = avatar;
    _v = v;
}

  User.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _cnic = json['cnic'];
    _email = json['email'];
    _phone = json['phone'];
    _role = json['role'];
    _status = json['status'];
    _area = json['area'];
    if (json['inventory'] != null) {
      _inventory = [];
      json['inventory'].forEach((v) {
        _inventory?.add(Inventory.fromJson(v));
      });
    }
    _avatar = json['avatar'];
    _v = json['__v'];
  }
  String? _id;
  String? _name;
  int? _cnic;
  String? _email;
  int? _phone;
  String? _role;
  String? _status;
  String? _area;
  List<Inventory>? _inventory;
  String? _avatar;
  int? _v;

  String? get id => _id;
  String? get name => _name;
  int? get cnic => _cnic;
  String? get email => _email;
  int? get phone => _phone;
  String? get role => _role;
  String? get status => _status;
  String? get area => _area;
  List<Inventory>? get inventory => _inventory;
  String? get avatar => _avatar;
  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['cnic'] = _cnic;
    map['email'] = _email;
    map['phone'] = _phone;
    map['role'] = _role;
    map['status'] = _status;
    map['area'] = _area;
    if (_inventory != null) {
      map['inventory'] = _inventory?.map((v) => v.toJson()).toList();
    }
    map['avatar'] = _avatar;
    map['__v'] = _v;
    return map;
  }

}

class Inventory {
  Inventory({
      String? id, 
      String? deviceType, 
      String? name, 
      List<String>? pics, 
      int? qty,}){
    _id = id;
    _deviceType = deviceType;
    _name = name;
    _pics = pics;
    _qty = qty;
}

  Inventory.fromJson(dynamic json) {
    _id = json['_id'];
    _deviceType = json['deviceType'];
    _name = json['name'];
    _pics = json['pics'] != null ? json['pics'].cast<String>() : [];
    _qty = json['qty'];
  }
  String? _id;
  String? _deviceType;
  String? _name;
  List<String>? _pics;
  int? _qty;

  String? get id => _id;
  String? get deviceType => _deviceType;
  String? get name => _name;
  List<String>? get pics => _pics;
  int? get qty => _qty;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['deviceType'] = _deviceType;
    map['name'] = _name;
    map['pics'] = _pics;
    map['qty'] = _qty;
    return map;
  }

}