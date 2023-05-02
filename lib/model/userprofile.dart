/// error : false
/// message : "User Data Get Successfully"
/// data : [{"id":"106","ip_address":"27.62.229.242","username":"raj","password":"$2y$10$cYgZ48yxLikTraYyKg2J5ueE3DMPLCPYhdRA95b2xTVBVnoRC7lmS","email":"r1@gmail.com","mobile":"9109599773","image":"https://developmentalphawizz.com/financego/","balance":"806000","activation_selector":"942103807fbb8b03b80e","activation_code":"$2y$10$mP2bMKOcWfXDbIn99wJHUu8lcmXaLJv.tZwxozaHscNnQDr9mND3e","forgotten_password_selector":null,"forgotten_password_code":null,"forgotten_password_time":null,"remember_selector":null,"remember_code":null,"created_on":"1680600832","status":"0","last_login":null,"active":"1","company":null,"address":"Indore","bonus":null,"cash_received":"0.00","dob":null,"country_code":null,"city":null,"upi_id":"9933399333@subkawallet","qrcode":"https://developmentalphawizz.com/financego/uploads/qrcode/1473273523.png","barcode_link":null,"barcode":null,"area":null,"device_token":null,"street":null,"pincode":null,"apikey":null,"referral_code":null,"friends_code":null,"fcm_id":null,"latitude":null,"longitude":null,"created_at":"0000-00-00","otp":"0","otp_status":"0"}]

class Userprofile {
  Userprofile({
      bool? error, 
      String? message, 
      List<Data>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  Userprofile.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<Data>? _data;
Userprofile copyWith({  bool? error,
  String? message,
  List<Data>? data,
}) => Userprofile(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "106"
/// ip_address : "27.62.229.242"
/// username : "raj"
/// password : "$2y$10$cYgZ48yxLikTraYyKg2J5ueE3DMPLCPYhdRA95b2xTVBVnoRC7lmS"
/// email : "r1@gmail.com"
/// mobile : "9109599773"
/// image : "https://developmentalphawizz.com/financego/"
/// balance : "806000"
/// activation_selector : "942103807fbb8b03b80e"
/// activation_code : "$2y$10$mP2bMKOcWfXDbIn99wJHUu8lcmXaLJv.tZwxozaHscNnQDr9mND3e"
/// forgotten_password_selector : null
/// forgotten_password_code : null
/// forgotten_password_time : null
/// remember_selector : null
/// remember_code : null
/// created_on : "1680600832"
/// status : "0"
/// last_login : null
/// active : "1"
/// company : null
/// address : "Indore"
/// bonus : null
/// cash_received : "0.00"
/// dob : null
/// country_code : null
/// city : null
/// upi_id : "9933399333@subkawallet"
/// qrcode : "https://developmentalphawizz.com/financego/uploads/qrcode/1473273523.png"
/// barcode_link : null
/// barcode : null
/// area : null
/// device_token : null
/// street : null
/// pincode : null
/// apikey : null
/// referral_code : null
/// friends_code : null
/// fcm_id : null
/// latitude : null
/// longitude : null
/// created_at : "0000-00-00"
/// otp : "0"
/// otp_status : "0"

class Data {
  Data({
      String? id, 
      String? ipAddress, 
      String? username, 
      String? password, 
      String? email, 
      String? mobile, 
      String? image, 
      String? balance, 
      String? activationSelector, 
      String? activationCode, 
      dynamic forgottenPasswordSelector, 
      dynamic forgottenPasswordCode, 
      dynamic forgottenPasswordTime, 
      dynamic rememberSelector, 
      dynamic rememberCode, 
      String? createdOn, 
      String? status, 
      dynamic lastLogin, 
      String? active, 
      dynamic company, 
      String? address, 
      dynamic bonus, 
      String? cashReceived, 
      dynamic dob, 
      dynamic countryCode, 
      dynamic city, 
      String? upiId, 
      String? qrcode, 
      dynamic barcodeLink, 
      dynamic barcode, 
      dynamic area, 
      dynamic deviceToken, 
      dynamic street, 
      dynamic pincode, 
      dynamic apikey, 
      dynamic referralCode, 
      dynamic friendsCode, 
      dynamic fcmId, 
      dynamic latitude, 
      dynamic longitude, 
      String? createdAt, 
      String? otp, 
      String? otpStatus,}){
    _id = id;
    _ipAddress = ipAddress;
    _username = username;
    _password = password;
    _email = email;
    _mobile = mobile;
    _image = image;
    _balance = balance;
    _activationSelector = activationSelector;
    _activationCode = activationCode;
    _forgottenPasswordSelector = forgottenPasswordSelector;
    _forgottenPasswordCode = forgottenPasswordCode;
    _forgottenPasswordTime = forgottenPasswordTime;
    _rememberSelector = rememberSelector;
    _rememberCode = rememberCode;
    _createdOn = createdOn;
    _status = status;
    _lastLogin = lastLogin;
    _active = active;
    _company = company;
    _address = address;
    _bonus = bonus;
    _cashReceived = cashReceived;
    _dob = dob;
    _countryCode = countryCode;
    _city = city;
    _upiId = upiId;
    _qrcode = qrcode;
    _barcodeLink = barcodeLink;
    _barcode = barcode;
    _area = area;
    _deviceToken = deviceToken;
    _street = street;
    _pincode = pincode;
    _apikey = apikey;
    _referralCode = referralCode;
    _friendsCode = friendsCode;
    _fcmId = fcmId;
    _latitude = latitude;
    _longitude = longitude;
    _createdAt = createdAt;
    _otp = otp;
    _otpStatus = otpStatus;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _ipAddress = json['ip_address'];
    _username = json['username'];
    _password = json['password'];
    _email = json['email'];
    _mobile = json['mobile'];
    _image = json['image'];
    _balance = json['balance'];
    _activationSelector = json['activation_selector'];
    _activationCode = json['activation_code'];
    _forgottenPasswordSelector = json['forgotten_password_selector'];
    _forgottenPasswordCode = json['forgotten_password_code'];
    _forgottenPasswordTime = json['forgotten_password_time'];
    _rememberSelector = json['remember_selector'];
    _rememberCode = json['remember_code'];
    _createdOn = json['created_on'];
    _status = json['status'];
    _lastLogin = json['last_login'];
    _active = json['active'];
    _company = json['company'];
    _address = json['address'];
    _bonus = json['bonus'];
    _cashReceived = json['cash_received'];
    _dob = json['dob'];
    _countryCode = json['country_code'];
    _city = json['city'];
    _upiId = json['upi_id'];
    _qrcode = json['qrcode'];
    _barcodeLink = json['barcode_link'];
    _barcode = json['barcode'];
    _area = json['area'];
    _deviceToken = json['device_token'];
    _street = json['street'];
    _pincode = json['pincode'];
    _apikey = json['apikey'];
    _referralCode = json['referral_code'];
    _friendsCode = json['friends_code'];
    _fcmId = json['fcm_id'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _createdAt = json['created_at'];
    _otp = json['otp'];
    _otpStatus = json['otp_status'];
  }
  String? _id;
  String? _ipAddress;
  String? _username;
  String? _password;
  String? _email;
  String? _mobile;
  String? _image;
  String? _balance;
  String? _activationSelector;
  String? _activationCode;
  dynamic _forgottenPasswordSelector;
  dynamic _forgottenPasswordCode;
  dynamic _forgottenPasswordTime;
  dynamic _rememberSelector;
  dynamic _rememberCode;
  String? _createdOn;
  String? _status;
  dynamic _lastLogin;
  String? _active;
  dynamic _company;
  String? _address;
  dynamic _bonus;
  String? _cashReceived;
  dynamic _dob;
  dynamic _countryCode;
  dynamic _city;
  String? _upiId;
  String? _qrcode;
  dynamic _barcodeLink;
  dynamic _barcode;
  dynamic _area;
  dynamic _deviceToken;
  dynamic _street;
  dynamic _pincode;
  dynamic _apikey;
  dynamic _referralCode;
  dynamic _friendsCode;
  dynamic _fcmId;
  dynamic _latitude;
  dynamic _longitude;
  String? _createdAt;
  String? _otp;
  String? _otpStatus;
Data copyWith({  String? id,
  String? ipAddress,
  String? username,
  String? password,
  String? email,
  String? mobile,
  String? image,
  String? balance,
  String? activationSelector,
  String? activationCode,
  dynamic forgottenPasswordSelector,
  dynamic forgottenPasswordCode,
  dynamic forgottenPasswordTime,
  dynamic rememberSelector,
  dynamic rememberCode,
  String? createdOn,
  String? status,
  dynamic lastLogin,
  String? active,
  dynamic company,
  String? address,
  dynamic bonus,
  String? cashReceived,
  dynamic dob,
  dynamic countryCode,
  dynamic city,
  String? upiId,
  String? qrcode,
  dynamic barcodeLink,
  dynamic barcode,
  dynamic area,
  dynamic deviceToken,
  dynamic street,
  dynamic pincode,
  dynamic apikey,
  dynamic referralCode,
  dynamic friendsCode,
  dynamic fcmId,
  dynamic latitude,
  dynamic longitude,
  String? createdAt,
  String? otp,
  String? otpStatus,
}) => Data(  id: id ?? _id,
  ipAddress: ipAddress ?? _ipAddress,
  username: username ?? _username,
  password: password ?? _password,
  email: email ?? _email,
  mobile: mobile ?? _mobile,
  image: image ?? _image,
  balance: balance ?? _balance,
  activationSelector: activationSelector ?? _activationSelector,
  activationCode: activationCode ?? _activationCode,
  forgottenPasswordSelector: forgottenPasswordSelector ?? _forgottenPasswordSelector,
  forgottenPasswordCode: forgottenPasswordCode ?? _forgottenPasswordCode,
  forgottenPasswordTime: forgottenPasswordTime ?? _forgottenPasswordTime,
  rememberSelector: rememberSelector ?? _rememberSelector,
  rememberCode: rememberCode ?? _rememberCode,
  createdOn: createdOn ?? _createdOn,
  status: status ?? _status,
  lastLogin: lastLogin ?? _lastLogin,
  active: active ?? _active,
  company: company ?? _company,
  address: address ?? _address,
  bonus: bonus ?? _bonus,
  cashReceived: cashReceived ?? _cashReceived,
  dob: dob ?? _dob,
  countryCode: countryCode ?? _countryCode,
  city: city ?? _city,
  upiId: upiId ?? _upiId,
  qrcode: qrcode ?? _qrcode,
  barcodeLink: barcodeLink ?? _barcodeLink,
  barcode: barcode ?? _barcode,
  area: area ?? _area,
  deviceToken: deviceToken ?? _deviceToken,
  street: street ?? _street,
  pincode: pincode ?? _pincode,
  apikey: apikey ?? _apikey,
  referralCode: referralCode ?? _referralCode,
  friendsCode: friendsCode ?? _friendsCode,
  fcmId: fcmId ?? _fcmId,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  createdAt: createdAt ?? _createdAt,
  otp: otp ?? _otp,
  otpStatus: otpStatus ?? _otpStatus,
);
  String? get id => _id;
  String? get ipAddress => _ipAddress;
  String? get username => _username;
  String? get password => _password;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get image => _image;
  String? get balance => _balance;
  String? get activationSelector => _activationSelector;
  String? get activationCode => _activationCode;
  dynamic get forgottenPasswordSelector => _forgottenPasswordSelector;
  dynamic get forgottenPasswordCode => _forgottenPasswordCode;
  dynamic get forgottenPasswordTime => _forgottenPasswordTime;
  dynamic get rememberSelector => _rememberSelector;
  dynamic get rememberCode => _rememberCode;
  String? get createdOn => _createdOn;
  String? get status => _status;
  dynamic get lastLogin => _lastLogin;
  String? get active => _active;
  dynamic get company => _company;
  String? get address => _address;
  dynamic get bonus => _bonus;
  String? get cashReceived => _cashReceived;
  dynamic get dob => _dob;
  dynamic get countryCode => _countryCode;
  dynamic get city => _city;
  String? get upiId => _upiId;
  String? get qrcode => _qrcode;
  dynamic get barcodeLink => _barcodeLink;
  dynamic get barcode => _barcode;
  dynamic get area => _area;
  dynamic get deviceToken => _deviceToken;
  dynamic get street => _street;
  dynamic get pincode => _pincode;
  dynamic get apikey => _apikey;
  dynamic get referralCode => _referralCode;
  dynamic get friendsCode => _friendsCode;
  dynamic get fcmId => _fcmId;
  dynamic get latitude => _latitude;
  dynamic get longitude => _longitude;
  String? get createdAt => _createdAt;
  String? get otp => _otp;
  String? get otpStatus => _otpStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['ip_address'] = _ipAddress;
    map['username'] = _username;
    map['password'] = _password;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['image'] = _image;
    map['balance'] = _balance;
    map['activation_selector'] = _activationSelector;
    map['activation_code'] = _activationCode;
    map['forgotten_password_selector'] = _forgottenPasswordSelector;
    map['forgotten_password_code'] = _forgottenPasswordCode;
    map['forgotten_password_time'] = _forgottenPasswordTime;
    map['remember_selector'] = _rememberSelector;
    map['remember_code'] = _rememberCode;
    map['created_on'] = _createdOn;
    map['status'] = _status;
    map['last_login'] = _lastLogin;
    map['active'] = _active;
    map['company'] = _company;
    map['address'] = _address;
    map['bonus'] = _bonus;
    map['cash_received'] = _cashReceived;
    map['dob'] = _dob;
    map['country_code'] = _countryCode;
    map['city'] = _city;
    map['upi_id'] = _upiId;
    map['qrcode'] = _qrcode;
    map['barcode_link'] = _barcodeLink;
    map['barcode'] = _barcode;
    map['area'] = _area;
    map['device_token'] = _deviceToken;
    map['street'] = _street;
    map['pincode'] = _pincode;
    map['apikey'] = _apikey;
    map['referral_code'] = _referralCode;
    map['friends_code'] = _friendsCode;
    map['fcm_id'] = _fcmId;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['created_at'] = _createdAt;
    map['otp'] = _otp;
    map['otp_status'] = _otpStatus;
    return map;
  }

}