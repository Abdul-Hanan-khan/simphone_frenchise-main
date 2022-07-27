class SimPackagesApiResponse {
  SimPackagesApiResponse({
      bool? result, 
      String? message, 
      List<Packages>? packages,}){
    _result = result;
    _message = message;
    _packages = packages;
}

  SimPackagesApiResponse.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    if (json['packages'] != null) {
      _packages = [];
      json['packages'].forEach((v) {
        _packages?.add(Packages.fromJson(v));
      });
    }
  }
  bool? _result;
  String? _message;
  List<Packages>? _packages;

  bool? get result => _result;
  String? get message => _message;
  List<Packages>? get packages => _packages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    map['message'] = _message;
    if (_packages != null) {
      map['packages'] = _packages?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Packages {
  Packages({
      String? id, 
      String? packageName, 
      String? type, 
      int? sameNetworkMins, 
      int? otherNetworkMins, 
      String? data, 
      int? messages, 
      String? expiry, 
      int? v,}){
    _id = id;
    _packageName = packageName;
    _type = type;
    _sameNetworkMins = sameNetworkMins;
    _otherNetworkMins = otherNetworkMins;
    _data = data;
    _messages = messages;
    _expiry = expiry;
    _v = v;
}

  Packages.fromJson(dynamic json) {
    _id = json['_id'];
    _packageName = json['packageName'];
    _type = json['type'];
    _sameNetworkMins = json['sameNetworkMins'];
    _otherNetworkMins = json['otherNetworkMins'];
    _data = json['data'];
    _messages = json['messages'];
    _expiry = json['expiry'];
    _v = json['__v'];
  }
  String? _id;
  String? _packageName;
  String? _type;
  int? _sameNetworkMins;
  int? _otherNetworkMins;
  String? _data;
  int? _messages;
  String? _expiry;
  int? _v;

  String? get id => _id;
  String? get packageName => _packageName;
  String? get type => _type;
  int? get sameNetworkMins => _sameNetworkMins;
  int? get otherNetworkMins => _otherNetworkMins;
  String? get data => _data;
  int? get messages => _messages;
  String? get expiry => _expiry;
  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['packageName'] = _packageName;
    map['type'] = _type;
    map['sameNetworkMins'] = _sameNetworkMins;
    map['otherNetworkMins'] = _otherNetworkMins;
    map['data'] = _data;
    map['messages'] = _messages;
    map['expiry'] = _expiry;
    map['__v'] = _v;
    return map;
  }

}