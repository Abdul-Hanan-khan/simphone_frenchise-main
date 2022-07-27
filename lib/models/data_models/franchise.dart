class Franchise {
  Franchise({
    Location? location,
    String? id,
    String? name,
    String? email,
    String? phone,
    String? status,
    String? address,
    String? role,
    List<dynamic>? inventory,
    String? avatar,
    int? v,}){
    _location = location;
    _id = id;
    _name = name;
    _email = email;
    _phone = phone;
    _status = status;
    _address = address;
    _role = role;
    _inventory = inventory;
    _avatar = avatar;
    _v = v;
  }

  Franchise.fromJson(dynamic json) {
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _id = json['_id'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _status = json['status'];
    _address = json['address'];
    _role = json['role'];
    if (json['inventory'] != null) {
      _inventory = [];
      json['inventory'].forEach((v) {
        _inventory?.add(v);
      });
    }
    _avatar = json['avatar'];
    _v = json['__v'];
  }
  Location? _location;
  String? _id;
  String? _name;
  String? _email;
  String? _phone;
  String? _status;
  String? _address;
  String? _role;
  List<dynamic>? _inventory;
  String? _avatar;
  int? _v;

  Location? get location => _location;
  String? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get phone => _phone;
  String? get status => _status;
  String? get address => _address;
  String? get role => _role;
  List<dynamic>? get inventory => _inventory;
  String? get avatar => _avatar;
  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['_id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['status'] = _status;
    map['address'] = _address;
    map['role'] = _role;
    if (_inventory != null) {
      map['inventory'] = _inventory?.map((v) => v.toJson()).toList();
    }
    map['avatar'] = _avatar;
    map['__v'] = _v;
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