/// responsecode : 1
/// status : true
/// data : [{"id":"11","name":"Airtel","category":"Prepaid"},{"id":"12","name":"Airtel Digital TV","category":"DTH"},{"id":"13","name":"BSNL","category":"Prepaid"},{"id":"14","name":"Dish TV","category":"DTH"},{"id":"4","name":"Idea","category":"Prepaid"},{"id":"18","name":"Jio","category":"Prepaid"},{"id":"35","name":"MTNL","category":"Prepaid"},{"id":"33","name":"MTNL Delhi","category":"Prepaid"},{"id":"34","name":"MTNL Mumbai","category":"Prepaid"},{"id":"27","name":"Sun Direct","category":"DTH"},{"id":"8","name":"Tata Sky","category":"DTH"},{"id":"10","name":"Videocon D2H","category":"DTH"},{"id":"22","name":"Vodafone","category":"Prepaid"}]
/// message : "Operator List Fetched"

class GetOperatorModel {
  GetOperatorModel({
      num? responsecode, 
      bool? status, 
      List<OperatorList>? data,
      String? message,}){
    _responsecode = responsecode;
    _status = status;
    _data = data;
    _message = message;
}

  GetOperatorModel.fromJson(dynamic json) {
    _responsecode = json['responsecode'];
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(OperatorList.fromJson(v));
      });
    }
    _message = json['message'];
  }
  num? _responsecode;
  bool? _status;
  List<OperatorList>? _data;
  String? _message;
GetOperatorModel copyWith({  num? responsecode,
  bool? status,
  List<OperatorList>? data,
  String? message,
}) => GetOperatorModel(
  responsecode: responsecode ?? _responsecode,
  status: status ?? _status,
  data: data ?? _data,
  message: message ?? _message,
);
  num? get responsecode => _responsecode;
  bool? get status => _status;
  List<OperatorList>? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['responsecode'] = _responsecode;
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}

/// id : "11"
/// name : "Airtel"
/// category : "Prepaid"

class OperatorList {
  OperatorList({
      String? id, 
      String? name, 
      String? category,}){
    _id = id;
    _name = name;
    _category = category;
}

  OperatorList.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _category = json['category'];
  }
  String? _id;
  String? _name;
  String? _category;
OperatorList copyWith({  String? id,
  String? name,
  String? category,
}) => OperatorList(  id: id ?? _id,
  name: name ?? _name,
  category: category ?? _category,
);
  String? get id => _id;
  String? get name => _name;
  String? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['category'] = _category;
    return map;
  }

}