class DashboardApiResponse {
  DashboardApiResponse({
      bool? result, 
      String? message, 
      AllOrders? allOrders,}){
    _result = result;
    _message = message;
    _allOrders = allOrders;
}

  DashboardApiResponse.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    _allOrders = json['allOrders'] != null ? AllOrders.fromJson(json['allOrders']) : null;
  }
  bool? _result;
  String? _message;
  AllOrders? _allOrders;

  bool? get result => _result;
  String? get message => _message;
  AllOrders? get allOrders => _allOrders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    map['message'] = _message;
    if (_allOrders != null) {
      map['allOrders'] = _allOrders?.toJson();
    }
    return map;
  }

}

class AllOrders {
  AllOrders({
      int? pendingOrders, 
      int? approvedOrders, 
      int? deliveredOrders, 
      int? rejectedOrders,}){
    _pendingOrders = pendingOrders;
    _approvedOrders = approvedOrders;
    _deliveredOrders = deliveredOrders;
    _rejectedOrders = rejectedOrders;
}

  AllOrders.fromJson(dynamic json) {
    _pendingOrders = json['pendingOrders'];
    _approvedOrders = json['approvedOrders'];
    _deliveredOrders = json['deliveredOrders'];
    _rejectedOrders = json['rejectedOrders'];
  }
  int? _pendingOrders;
  int? _approvedOrders;
  int? _deliveredOrders;
  int? _rejectedOrders;

  int? get pendingOrders => _pendingOrders;
  int? get approvedOrders => _approvedOrders;
  int? get deliveredOrders => _deliveredOrders;
  int? get rejectedOrders => _rejectedOrders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pendingOrders'] = _pendingOrders;
    map['approvedOrders'] = _approvedOrders;
    map['deliveredOrders'] = _deliveredOrders;
    map['rejectedOrders'] = _rejectedOrders;
    return map;
  }

}