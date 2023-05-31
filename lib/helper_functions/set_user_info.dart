import '../models/login_info_model.dart';

class UserInfo{
  static LoginInfoModel? loginInfoModel;
  static String? token;

  static setUserInfo(LoginInfoModel model){
    loginInfoModel=model;
  }

  static setToken(String? value){
    token=value;
    print('Set token $token');
  }
  static String getToket()=>token!;
}