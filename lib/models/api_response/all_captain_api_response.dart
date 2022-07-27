class AllCaptainApiResponse {
  AllCaptainApiResponse({
      bool? result, 
      String? message, 
      List<Captains>? captains,}){
    _result = result;
    _message = message;
    _captains = captains;
}

  AllCaptainApiResponse.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    if (json['captains'] != null) {
      _captains = [];
      json['captains'].forEach((v) {
        _captains?.add(Captains.fromJson(v));
      });
    }
  }
  bool? _result;
  String? _message;
  List<Captains>? _captains;

  bool? get result => _result;
  String? get message => _message;
  List<Captains>? get captains => _captains;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    map['message'] = _message;
    if (_captains != null) {
      map['captains'] = _captains?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Captains {
  Captains({
      String? id, 
      String? name, 
      int? cnic, 
      String? email, 
      String? phone, 
      String? role, 
      String? status, 
      String? address, 
      String? avatar, 
      String? password, 
      int? v,}){
    _id = id;
    _name = name;
    _cnic = cnic;
    _email = email;
    _phone = phone;
    _role = role;
    _status = status;
    _address = address;
    _avatar = avatar;
    _password = password;
    _v = v;
}

  Captains.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _cnic = json['cnic'];
    _email = json['email'];
    _phone = json['phone'];
    _role = json['role'];
    _status = json['status'];
    _address = json['address'];
    _avatar = json['avatar'];
    _password = json['password'];
    _v = json['__v'];
  }
  String? _id;
  String? _name;
  int? _cnic;
  String? _email;
  String? _phone;
  String? _role;
  String? _status;
  String? _address;
  String? _avatar;
  String? _password;
  int? _v;

  String? get id => _id;
  String? get name => _name;
  int? get cnic => _cnic;
  String? get email => _email;
  String? get phone => _phone;
  String? get role => _role;
  String? get status => _status;
  String? get address => _address;
  String? get avatar => _avatar;
  String? get password => _password;
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
    map['address'] = _address;
    map['avatar'] = _avatar;
    map['password'] = _password;
    map['__v'] = _v;
    return map;
  }

}