import '../data_models/franchise.dart';

class SignInApiResponse {
  SignInApiResponse({
      bool? result, 
      String? message, 
      User? data,}){
    _result = result;
    _message = message;
    _data = data;
}

  SignInApiResponse.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    _data = json['data'] != null ? User.fromJson(json['data']) : null;
  }
  bool? _result;
  String? _message;
  User? _data;

  bool? get result => _result;
  String? get message => _message;
  User? get data => _data;


}

class User {
  User({
      String? token, 
      Franchise? franchise,}){
    _token = token;
    _franchise = franchise;
}

  User.fromJson(dynamic json) {
    _token = json['token'];
    _franchise = json['franchise'] != null ? Franchise.fromJson(json['franchise']) : null;
  }
  String? _token;
  Franchise? _franchise;

  String? get token => _token;
  Franchise? get franchise => _franchise;


}

