class DeleteSimApiResponse {
  DeleteSimApiResponse({
      bool? result, 
      String? message, 
      Sim? sim,}){
    _result = result;
    _message = message;
    _sim = sim;
}

  DeleteSimApiResponse.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    // _sim = json['sim'] != null ? Sim.fromJson(json['sim']) : null;
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
      int? series,
      int? no,
      int? price,
      Captain? captain,
      int? v,}){
    _id = id;
    _network = network;
    _type = type;
    _series = series;
    _no = no;
    _price = price;
    _captain = captain;
    _v = v;
}

  Sim.fromJson(dynamic json) {
    _id = json['_id'];
    _network = json['network'];
    _type = json['type'];
    _series = json['series'];
    _no = json['no'];
    _price = json['price'];
    _captain = json['captain'] != null ? Captain.fromJson(json['captain']) : null;
    _v = json['__v'];
  }
  String? _id;
  String? _network;
  String? _type;
  int? _series;
  int? _no;
  int? _price;
  Captain? _captain;
  int? _v;

  String? get id => _id;
  String? get network => _network;
  String? get type => _type;
  int? get series => _series;
  int? get no => _no;
  int? get price => _price;
  Captain? get captain => _captain;
  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['network'] = _network;
    map['type'] = _type;
    map['series'] = _series;
    map['no'] = _no;
    map['price'] = _price;
    if (_captain != null) {
      map['captain'] = _captain?.toJson();
    }
    map['__v'] = _v;
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