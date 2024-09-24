/// status : true
/// user : {"userId":2,"name":"Admin","email":"admin@domain.com","status":"1","last_login":"2023-05-23 06:00:40","isActive":true,"roleId":"2","role":"admin","primaryPhone":"","gender":"","dob":"","country":"","countryName":"","avatar":"https://goldprice.absolutezerobd.com/images/defaults/no_image.jpg","type":"administration","userTypeId":2}
/// access_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmJlMDZmZDM3M2Y5ODI3YjJkMzVlYzAzOWExNTAwYjg0ZGUxOTg1NzExOTExMGVjZDNlMzQ1YjZjYzc3NzBhOWQwNTBiYTk3ZmJkYmQ3YWIiLCJpYXQiOjE2ODQ4MjE2NDAuMjM2MTksIm5iZiI6MTY4NDgyMTY0MC4yMzYxOTMsImV4cCI6MTcxNjQ0NDA0MC4yMzA1NTcsInN1YiI6IjIiLCJzY29wZXMiOltdfQ.lsdxtMy_vDehfc_J_6w_UxJISVO36zy_shfjPl5bPjwGT6jWSoD9pyI6oUBSVp0QItQUj4B6ZtVW8OOwZQOjfAtYT-5FLSZkGEWxGDbCE-8v6A5s41SY5C3sm_5OH3wtqys5LGiB6_mG9T6TxQZeaBJPuJBBZJ8oZN1n5waD3udFtT2Wj0G_vq3t6RDBAiXzaaR2n-x0raWforcLtGa8U6StQDnhs7_DfkHB82j9w10uQU3vSnpxVhtStywEEQ9bGWq6VnAJudGIWiOgm3Gwz6D2FsRihrXvMkXCDGwsdF4_XM_P8WK_QUAZwq0C5gIwxE9ZGGA83FYJWDWLLQ524Ppb54tM8yADbxnuoRcgsSwUsJmvM_2iz6CGz7WZcegIc5_cb8RKJr7ABZR9RNSsN9X-Nr-of5foPPQCk--Xuo0dF8LLTvR3Nb7STTb-BQymaKoby_2Fka68alL2nUDU_6PgWwvtMi7DScYyvOxGSwt5Cd_6miwyQ8SKjbx__cv3r5dMoZV4QGCMJ1dcDB35UyNSbl6CwabR7F5HrxUXa0dVynuhZq1o-zm2z7qc1H2nMczls6E2TcS_5Ju-pHkx5BAWqfs7XywHU3bnrq1dsZiR0D5upbT-N6fPLSW7sXIZAoDtEOwzni3Qal1_1wvz4f3IfNy6Ei06BepSJeuHnr0"
/// permissionsList : ["all_permissions"]
/// msg : "Logged in successfully!"

class LoginInfoModel {
  LoginInfoModel({
      bool? status, 
      User? user, 
      String? accessToken, 
      List<String>? permissionsList, 
      String? msg,}){
    _status = status;
    _user = user;
    _accessToken = accessToken;
    _permissionsList = permissionsList;
    _msg = msg;
}

  LoginInfoModel.fromJson(dynamic json) {
    _status = json['status'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _accessToken = json['access_token'];
    _permissionsList = json['permissionsList'] != null ? json['permissionsList'].cast<String>() : [];
    _msg = json['msg'];
  }
  bool? _status;
  User? _user;
  String? _accessToken;
  List<String>? _permissionsList;
  String? _msg;
LoginInfoModel copyWith({  bool? status,
  User? user,
  String? accessToken,
  List<String>? permissionsList,
  String? msg,
}) => LoginInfoModel(  status: status ?? _status,
  user: user ?? _user,
  accessToken: accessToken ?? _accessToken,
  permissionsList: permissionsList ?? _permissionsList,
  msg: msg ?? _msg,
);
  bool? get status => _status;
  User? get user => _user;
  String? get accessToken => _accessToken;
  List<String>? get permissionsList => _permissionsList;
  String? get msg => _msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['access_token'] = _accessToken;
    map['permissionsList'] = _permissionsList;
    map['msg'] = _msg;
    return map;
  }

}

/// userId : 2
/// name : "Admin"
/// email : "admin@domain.com"
/// status : "1"
/// last_login : "2023-05-23 06:00:40"
/// isActive : true
/// roleId : "2"
/// role : "admin"
/// primaryPhone : ""
/// gender : ""
/// dob : ""
/// country : ""
/// countryName : ""
/// avatar : "https://goldprice.absolutezerobd.com/images/defaults/no_image.jpg"
/// type : "administration"
/// userTypeId : 2

class User {
  User({
      num? userId, 
      String? name, 
      String? email, 
      String? status, 
      String? lastLogin, 
      bool? isActive, 
      String? roleId, 
      String? role, 
      String? primaryPhone, 
      String? gender, 
      String? dob, 
      String? country, 
      String? countryName, 
      String? avatar, 
      String? type, 
      num? userTypeId,}){
    _userId = userId;
    _name = name;
    _email = email;
    _status = status;
    _lastLogin = lastLogin;
    _isActive = isActive;
    _roleId = roleId;
    _role = role;
    _primaryPhone = primaryPhone;
    _gender = gender;
    _dob = dob;
    _country = country;
    _countryName = countryName;
    _avatar = avatar;
    _type = type;
    _userTypeId = userTypeId;
}

  User.fromJson(dynamic json) {
    _userId = json['userId'];
    _name = json['name'];
    _email = json['email'];
    _status = json['status'];
    _lastLogin = json['last_login'];
    _isActive = json['isActive'];
    _roleId = json['roleId'];
    _role = json['role'];
    _primaryPhone = json['primaryPhone'];
    _gender = json['gender'];
    _dob = json['dob'];
    _country = json['country'];
    _countryName = json['countryName'];
    _avatar = json['avatar'];
    _type = json['type'];
    _userTypeId = json['userTypeId'];
  }
  num? _userId;
  String? _name;
  String? _email;
  String? _status;
  String? _lastLogin;
  bool? _isActive;
  String? _roleId;
  String? _role;
  String? _primaryPhone;
  String? _gender;
  String? _dob;
  String? _country;
  String? _countryName;
  String? _avatar;
  String? _type;
  num? _userTypeId;
User copyWith({  num? userId,
  String? name,
  String? email,
  String? status,
  String? lastLogin,
  bool? isActive,
  String? roleId,
  String? role,
  String? primaryPhone,
  String? gender,
  String? dob,
  String? country,
  String? countryName,
  String? avatar,
  String? type,
  num? userTypeId,
}) => User(  userId: userId ?? _userId,
  name: name ?? _name,
  email: email ?? _email,
  status: status ?? _status,
  lastLogin: lastLogin ?? _lastLogin,
  isActive: isActive ?? _isActive,
  roleId: roleId ?? _roleId,
  role: role ?? _role,
  primaryPhone: primaryPhone ?? _primaryPhone,
  gender: gender ?? _gender,
  dob: dob ?? _dob,
  country: country ?? _country,
  countryName: countryName ?? _countryName,
  avatar: avatar ?? _avatar,
  type: type ?? _type,
  userTypeId: userTypeId ?? _userTypeId,
);
  num? get userId => _userId;
  String? get name => _name;
  String? get email => _email;
  String? get status => _status;
  String? get lastLogin => _lastLogin;
  bool? get isActive => _isActive;
  String? get roleId => _roleId;
  String? get role => _role;
  String? get primaryPhone => _primaryPhone;
  String? get gender => _gender;
  String? get dob => _dob;
  String? get country => _country;
  String? get countryName => _countryName;
  String? get avatar => _avatar;
  String? get type => _type;
  num? get userTypeId => _userTypeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['name'] = _name;
    map['email'] = _email;
    map['status'] = _status;
    map['last_login'] = _lastLogin;
    map['isActive'] = _isActive;
    map['roleId'] = _roleId;
    map['role'] = _role;
    map['primaryPhone'] = _primaryPhone;
    map['gender'] = _gender;
    map['dob'] = _dob;
    map['country'] = _country;
    map['countryName'] = _countryName;
    map['avatar'] = _avatar;
    map['type'] = _type;
    map['userTypeId'] = _userTypeId;
    return map;
  }

}