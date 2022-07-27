import '../data_models/user.dart';

class AddNewCaptainApiResponse {
  AddNewCaptainApiResponse({
    bool? result,
    String? message,
    User? user,
  }) {
    _result = result;
    _message = message;
    _user = user;
  }

  AddNewCaptainApiResponse.fromJson(dynamic json) {
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
}

class Franchise {
  Franchise({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? address,
  }) {
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
  String? _phone;
  String? _address;

  String? get id => _id;

  String? get name => _name;

  String? get email => _email;

  String? get phone => _phone;

  String? get address => _address;
}

class Location {
  Location({
    String? type,
    List<int>? coordinates,
  }) {
    _type = type;
    _coordinates = coordinates;
  }

  Location.fromJson(dynamic json) {
    _type = json['type'];
    _coordinates = json['coordinates'] != null ? json['coordinates'].cast<int>() : [];
  }

  String? _type;
  List<int>? _coordinates;

  String? get type => _type;

  List<int>? get coordinates => _coordinates;
}
