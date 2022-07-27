class AllSimApiResponse {
  AllSimApiResponse({
      bool? result, 
      String? message, 
      List<Sims>? sims,}){
    _result = result;
    _message = message;
    _sims = sims;
}

  AllSimApiResponse.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    if (json['sims'] != null) {
      _sims = [];
      json['sims'].forEach((v) {
        _sims?.add(Sims.fromJson(v));
      });
    }
  }
  bool? _result;
  String? _message;
  List<Sims>? _sims;

  bool? get result => _result;
  String? get message => _message;
  List<Sims>? get sims => _sims;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    map['message'] = _message;
    if (_sims != null) {
      map['sims'] = _sims?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Sims {
  Sims({
      String? id, 
      String? network, 
      String? numberType, 
      String? simType, 
      String? series, 
      String? no, 
      String? completeNo, 
      int? price, 
      int? discountPrice, 
      int? discount, 
      bool? available, 
      Franchise? franchise, 
      Package? package, 
      int? v,}){
    _id = id;
    _network = network;
    _numberType = numberType;
    _simType = simType;
    _series = series;
    _no = no;
    _completeNo = completeNo;
    _price = price;
    _discountPrice = discountPrice;
    _discount = discount;
    _available = available;
    _franchise = franchise;
    _package = package;
    _v = v;
}

  Sims.fromJson(dynamic json) {
    _id = json['_id'];
    _network = json['network'];
    _numberType = json['numberType'];
    _simType = json['simType'];
    _series = json['series'];
    _no = json['no'];
    _completeNo = json['completeNo'];
    _price = json['price'];
    _discountPrice = json['discountPrice'];
    _discount = json['discount'];
    _available = json['available'];
    _franchise = json['franchise'] != null ? Franchise.fromJson(json['franchise']) : null;
    _package = json['package'] != null ? Package.fromJson(json['package']) : null;
    _v = json['__v'];
  }
  String? _id;
  String? _network;
  String? _numberType;
  String? _simType;
  String? _series;
  String? _no;
  String? _completeNo;
  int? _price;
  int? _discountPrice;
  int? _discount;
  bool? _available;
  Franchise? _franchise;
  Package? _package;
  int? _v;

  String? get id => _id;
  String? get network => _network;
  String? get numberType => _numberType;
  String? get simType => _simType;
  String? get series => _series;
  String? get no => _no;
  String? get completeNo => _completeNo;
  int? get price => _price;
  int? get discountPrice => _discountPrice;
  int? get discount => _discount;
  bool? get available => _available;
  Franchise? get franchise => _franchise;
  Package? get package => _package;
  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['network'] = _network;
    map['numberType'] = _numberType;
    map['simType'] = _simType;
    map['series'] = _series;
    map['no'] = _no;
    map['completeNo'] = _completeNo;
    map['price'] = _price;
    map['discountPrice'] = _discountPrice;
    map['discount'] = _discount;
    map['available'] = _available;
    if (_franchise != null) {
      map['franchise'] = _franchise?.toJson();
    }
    if (_package != null) {
      map['package'] = _package?.toJson();
    }
    map['__v'] = _v;
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

class Franchise {
  Franchise({
      String? id, 
      String? name, 
      String? email, 
      int? phone, 
      String? address,}){
    _id = id;
    _name = name;
    _email = email;
    _phone = phone;
    _address = address;
}

  Franchise.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _address = json['address'];
  }
  String? _id;
  String? _name;
  String? _email;
  int? _phone;
  String? _address;

  String? get id => _id;
  String? get name => _name;
  String? get email => _email;
  int? get phone => _phone;
  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['address'] = _address;
    return map;
  }

}