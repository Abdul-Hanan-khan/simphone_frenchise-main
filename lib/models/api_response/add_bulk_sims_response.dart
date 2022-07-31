class AddBulkSimsModal {
  bool? result;
  String? message;
  List<Sims>? sims;

  AddBulkSimsModal({this.result, this.message, this.sims});

  AddBulkSimsModal.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    if (json['sims'] != null) {
      sims = <Sims>[];
      json['sims'].forEach((v) {
        sims!.add(new Sims.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['message'] = this.message;
    if (this.sims != null) {
      data['sims'] = this.sims!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sims {
  String? network;
  String? numberType;
  String? simType;
  String? series;
  String? no;
  String? completeNo;
  int? price;
  int? discount;
  bool? available;
  Franchise? franchise;
  Package? package;
  String? sId;
  int? iV;

  Sims(
      {this.network,
        this.numberType,
        this.simType,
        this.series,
        this.no,
        this.completeNo,
        this.price,
        this.discount,
        this.available,
        this.franchise,
        this.package,
        this.sId,
        this.iV});

  Sims.fromJson(Map<String, dynamic> json) {
    network = json['network'];
    numberType = json['numberType'];
    simType = json['simType'];
    series = json['series'];
    no = json['no'];
    completeNo = json['completeNo'];
    price = json['price'];
    discount = json['discount'];
    available = json['available'];
    franchise = json['franchise'] != null
        ? new Franchise.fromJson(json['franchise'])
        : null;
    package =
    json['package'] != null ? new Package.fromJson(json['package']) : null;
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['network'] = this.network;
    data['numberType'] = this.numberType;
    data['simType'] = this.simType;
    data['series'] = this.series;
    data['no'] = this.no;
    data['completeNo'] = this.completeNo;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['available'] = this.available;
    if (this.franchise != null) {
      data['franchise'] = this.franchise!.toJson();
    }
    if (this.package != null) {
      data['package'] = this.package!.toJson();
    }
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}

class Franchise {
  String? sId;
  String? name;
  String? email;
  int? phone;
  String? address;

  Franchise({this.sId, this.name, this.email, this.phone, this.address});

  Franchise.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    return data;
  }
}

class Package {
  String? packageName;
  int? sameNetworkMins;
  int? otherNetworkMins;
  String? data;
  int? messages;
  String? expiry;
  String? sId;

  Package(
      {this.packageName,
        this.sameNetworkMins,
        this.otherNetworkMins,
        this.data,
        this.messages,
        this.expiry,
        this.sId});

  Package.fromJson(Map<String, dynamic> json) {
    packageName = json['packageName'];
    sameNetworkMins = json['sameNetworkMins'];
    otherNetworkMins = json['otherNetworkMins'];
    data = json['data'];
    messages = json['messages'];
    expiry = json['expiry'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['packageName'] = this.packageName;
    data['sameNetworkMins'] = this.sameNetworkMins;
    data['otherNetworkMins'] = this.otherNetworkMins;
    data['data'] = this.data;
    data['messages'] = this.messages;
    data['expiry'] = this.expiry;
    data['_id'] = this.sId;
    return data;
  }
}
