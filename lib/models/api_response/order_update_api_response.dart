class OrderUpdateApiResponse {
  OrderUpdateApiResponse({
      bool? result, 
      String? message, 
      Order? order,}){
    _result = result;
    _message = message;
    _order = order;
}

  OrderUpdateApiResponse.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    _order = json['order'] != null ? Order.fromJson(json['order']) : null;
  }
  bool? _result;
  String? _message;
  Order? _order;

  bool? get result => _result;
  String? get message => _message;
  Order? get order => _order;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    map['message'] = _message;
    if (_order != null) {
      map['order'] = _order?.toJson();
    }
    return map;
  }

}

class Order {
  Order({
      String? id, 
      String? type, 
      int? totalBill, 
      String? status, 
      String? lat, 
      String? long, 
      String? recieverName, 
      String? contactNo, 
      String? email, 
      String? deliveryAddress, 
      int? storesCut, 
      Product? product, 
      Customer? customer, 
      Franchise? franchise, 
      String? date, 
      int? v, 
      Captain? captain, 
      String? deliveryTime,}){
    _id = id;
    _type = type;
    _totalBill = totalBill;
    _status = status;
    _lat = lat;
    _long = long;
    _recieverName = recieverName;
    _contactNo = contactNo;
    _email = email;
    _deliveryAddress = deliveryAddress;
    _storesCut = storesCut;
    _product = product;
    _customer = customer;
    _franchise = franchise;
    _date = date;
    _v = v;
    _captain = captain;
    _deliveryTime = deliveryTime;
}

  Order.fromJson(dynamic json) {
    _id = json['_id'];
    _type = json['type'];
    _totalBill = json['totalBill'];
    _status = json['status'];
    _lat = json['lat'];
    _long = json['long'];
    _recieverName = json['recieverName'];
    _contactNo = json['contactNo'];
    _email = json['email'];
    _deliveryAddress = json['deliveryAddress'];
    _storesCut = json['storesCut'];
    _product = json['product'] != null ? Product.fromJson(json['product']) : null;
    _customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    _franchise = json['franchise'] != null ? Franchise.fromJson(json['franchise']) : null;
    _date = json['date'];
    _v = json['__v'];
    _captain = json['captain'] != null ? Captain.fromJson(json['captain']) : null;
    _deliveryTime = json['deliveryTime'];
  }
  String? _id;
  String? _type;
  int? _totalBill;
  String? _status;
  String? _lat;
  String? _long;
  String? _recieverName;
  String? _contactNo;
  String? _email;
  String? _deliveryAddress;
  int? _storesCut;
  Product? _product;
  Customer? _customer;
  Franchise? _franchise;
  String? _date;
  int? _v;
  Captain? _captain;
  String? _deliveryTime;

  String? get id => _id;
  String? get type => _type;
  int? get totalBill => _totalBill;
  String? get status => _status;
  String? get lat => _lat;
  String? get long => _long;
  String? get recieverName => _recieverName;
  String? get contactNo => _contactNo;
  String? get email => _email;
  String? get deliveryAddress => _deliveryAddress;
  int? get storesCut => _storesCut;
  Product? get product => _product;
  Customer? get customer => _customer;
  Franchise? get franchise => _franchise;
  String? get date => _date;
  int? get v => _v;
  Captain? get captain => _captain;
  String? get deliveryTime => _deliveryTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['type'] = _type;
    map['totalBill'] = _totalBill;
    map['status'] = _status;
    map['lat'] = _lat;
    map['long'] = _long;
    map['recieverName'] = _recieverName;
    map['contactNo'] = _contactNo;
    map['email'] = _email;
    map['deliveryAddress'] = _deliveryAddress;
    map['storesCut'] = _storesCut;
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    if (_customer != null) {
      map['customer'] = _customer?.toJson();
    }
    if (_franchise != null) {
      map['franchise'] = _franchise?.toJson();
    }
    map['date'] = _date;
    map['__v'] = _v;
    if (_captain != null) {
      map['captain'] = _captain?.toJson();
    }
    map['deliveryTime'] = _deliveryTime;
    return map;
  }

}

class Captain {
  Captain({
      String? id, 
      String? name, 
      String? phone, 
      String? address,}){
    _id = id;
    _name = name;
    _phone = phone;
    _address = address;
}

  Captain.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _phone = json['phone'];
    _address = json['address'];
  }
  String? _id;
  String? _name;
  String? _phone;
  String? _address;

  String? get id => _id;
  String? get name => _name;
  String? get phone => _phone;
  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['phone'] = _phone;
    map['address'] = _address;
    return map;
  }

}

class Franchise {
  Franchise({
      String? id, 
      String? name, 
      String? phone, 
      String? email, 
      String? address,}){
    _id = id;
    _name = name;
    _phone = phone;
    _email = email;
    _address = address;
}

  Franchise.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _phone = json['phone'];
    _email = json['email'];
    _address = json['address'];
  }
  String? _id;
  String? _name;
  String? _phone;
  String? _email;
  String? _address;

  String? get id => _id;
  String? get name => _name;
  String? get phone => _phone;
  String? get email => _email;
  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['phone'] = _phone;
    map['email'] = _email;
    map['address'] = _address;
    return map;
  }

}

class Customer {
  Customer({
      String? id, 
      String? name, 
      String? phone,}){
    _id = id;
    _name = name;
    _phone = phone;
}

  Customer.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _phone = json['phone'];
  }
  String? _id;
  String? _name;
  String? _phone;

  String? get id => _id;
  String? get name => _name;
  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['phone'] = _phone;
    return map;
  }

}

class Product {
  Product({
      String? id, 
      String? type, 
      String? network, 
      String? nameOrNum, 
      int? price,}){
    _id = id;
    _type = type;
    _network = network;
    _nameOrNum = nameOrNum;
    _price = price;
}

  Product.fromJson(dynamic json) {
    _id = json['_id'];
    _type = json['type'];
    _network = json['network'];
    _nameOrNum = json['NameOrNum'];
    _price = json['price'];
  }
  String? _id;
  String? _type;
  String? _network;
  String? _nameOrNum;
  int? _price;

  String? get id => _id;
  String? get type => _type;
  String? get network => _network;
  String? get nameOrNum => _nameOrNum;
  int? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['type'] = _type;
    map['network'] = _network;
    map['NameOrNum'] = _nameOrNum;
    map['price'] = _price;
    return map;
  }

}