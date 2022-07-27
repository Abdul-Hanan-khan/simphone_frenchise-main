class DataSimPackagesApiResponse {
  DataSimPackagesApiResponse({
      bool? result, 
      String? message, 
      List<DataPackages>? packages,}){
    _result = result;
    _message = message;
    _packages = packages;
}

  DataSimPackagesApiResponse.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    if (json['packages'] != null) {
      _packages = [];
      json['packages'].forEach((v) {
        _packages?.add(DataPackages.fromJson(v));
      });
    }
  }
  bool? _result;
  String? _message;
  List<DataPackages>? _packages;

  bool? get result => _result;
  String? get message => _message;
  List<DataPackages>? get packages => _packages;

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

class DataPackages {
  DataPackages({
      String? id, 
      String? packageName, 
      String? type, 
      String? data, 
      String? expiry, 
      int? v,}){
    _id = id;
    _packageName = packageName;
    _type = type;
    _data = data;
    _expiry = expiry;
    _v = v;
}

  DataPackages.fromJson(dynamic json) {
    _id = json['_id'];
    _packageName = json['packageName'];
    _type = json['type'];
    _data = json['data'];
    _expiry = json['expiry'];
    _v = json['__v'];
  }
  String? _id;
  String? _packageName;
  String? _type;
  String? _data;
  String? _expiry;
  int? _v;

  String? get id => _id;
  String? get packageName => _packageName;
  String? get type => _type;
  String? get data => _data;
  String? get expiry => _expiry;
  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['packageName'] = _packageName;
    map['type'] = _type;
    map['data'] = _data;
    map['expiry'] = _expiry;
    map['__v'] = _v;
    return map;
  }

}