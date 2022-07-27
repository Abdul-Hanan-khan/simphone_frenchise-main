class EditSimApiResponse {
  EditSimApiResponse({
      bool? result, 
      String? message, 
      Sim? sim,}){
    _result = result;
    _message = message;
    _sim = sim;
}

  EditSimApiResponse.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    _sim = json['sim'] != null ? Sim.fromJson(json['sim']) : null;
  }
  bool? _result;
  String? _message;
  Sim? _sim;

  bool? get result => _result;
  String? get message => _message;
  Sim? get sim => _sim;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    map['message'] = _message;
    if (_sim != null) {
      map['sim'] = _sim?.toJson();
    }
    return map;
  }

}

class Sim {
  Sim({
      String? id, 
      String? network, 
      String? type, 
      String? series, 
      String? no, 
      int? price, 
      bool? available, 
      Captain? captain, 
      Package? package, 
      int? v, 
      int? discount, 
      int? discountPrice,}){
    _id = id;
    _network = network;
    _type = type;
    _series = series;
    _no = no;
    _price = price;
    _available = available;
    _captain = captain;
    _package = package;
    _v = v;
    _discount = discount;
    _discountPrice = discountPrice;
}

  Sim.fromJson(dynamic json) {
    _id = json['_id'];
    _network = json['network'];
    _type = json['type'];
    _series = json['series'];
    _no = json['no'];
    _price = json['price'];
    _available = json['available'];
    _captain = json['captain'] != null ? Captain.fromJson(json['captain']) : null;
    _package = json['package'] != null ? Package.fromJson(json['package']) : null;
    _v = json['__v'];
    _discount = json['discount'];
    _discountPrice = json['discountPrice'];
  }
  String? _id;
  String? _network;
  String? _type;
  String? _series;
  String? _no;
  int? _price;
  bool? _available;
  Captain? _captain;
  Package? _package;
  int? _v;
  int? _discount;
  int? _discountPrice;

  String? get id => _id;
  String? get network => _network;
  String? get type => _type;
  String? get series => _series;
  String? get no => _no;
  int? get price => _price;
  bool? get available => _available;
  Captain? get captain => _captain;
  Package? get package => _package;
  int? get v => _v;
  int? get discount => _discount;
  int? get discountPrice => _discountPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['network'] = _network;
    map['type'] = _type;
    map['series'] = _series;
    map['no'] = _no;
    map['price'] = _price;
    map['available'] = _available;
    if (_captain != null) {
      map['captain'] = _captain?.toJson();
    }
    if (_package != null) {
      map['package'] = _package?.toJson();
    }
    map['__v'] = _v;
    map['discount'] = _discount;
    map['discountPrice'] = _discountPrice;
    return map;
  }

}

class Package {
  Package({
      String? packageName, 
      int? sameNetworkMins, 
      int? otherNetworkMins, 
      String? data, 
      int? messages, 
      String? expiry, 
      String? id,}){
    _packageName = packageName;
    _sameNetworkMins = sameNetworkMins;
    _otherNetworkMins = otherNetworkMins;
    _data = data;
    _messages = messages;
    _expiry = expiry;
    _id = id;
}

  Package.fromJson(dynamic json) {
    _packageName = json['packageName'];
    _sameNetworkMins = json['sameNetworkMins'];
    _otherNetworkMins = json['otherNetworkMins'];
    _data = json['data'];
    _messages = json['messages'];
    _expiry = json['expiry'];
    _id = json['_id'];
  }
  String? _packageName;
  int? _sameNetworkMins;
  int? _otherNetworkMins;
  String? _data;
  int? _messages;
  String? _expiry;
  String? _id;

  String? get packageName => _packageName;
  int? get sameNetworkMins => _sameNetworkMins;
  int? get otherNetworkMins => _otherNetworkMins;
  String? get data => _data;
  int? get messages => _messages;
  String? get expiry => _expiry;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['packageName'] = _packageName;
    map['sameNetworkMins'] = _sameNetworkMins;
    map['otherNetworkMins'] = _otherNetworkMins;
    map['data'] = _data;
    map['messages'] = _messages;
    map['expiry'] = _expiry;
    map['_id'] = _id;
    return map;
  }

}

class Captain {
  Captain({
      String? id, 
      String? name, 
      int? phone, 
      String? area,}){
    _id = id;
    _name = name;
    _phone = phone;
    _area = area;
}

  Captain.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _phone = json['phone'];
    _area = json['area'];
  }
  String? _id;
  String? _name;
  int? _phone;
  String? _area;

  String? get id => _id;
  String? get name => _name;
  int? get phone => _phone;
  String? get area => _area;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['phone'] = _phone;
    map['area'] = _area;
    return map;
  }

}