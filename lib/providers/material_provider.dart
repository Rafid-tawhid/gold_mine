import 'package:flutter/cupertino.dart';
import 'package:gold_mine/api_calls/api_calls.dart';
import 'package:gold_mine/models/gold_model.dart';

class MaterialProvider extends ChangeNotifier{

  List<MaterialPrice> materialPriceList=[];

 // Future<Map<String, dynamic>> getTokenAndLogin(String email,String password) async{
 //   print('calling api');
 //   await ApiCalls.getTokenAndLogin(email,password).then((value) {
 //      print('calling api 2 ');
 //      if(value['status']=='success'){
 //        print('THIS IS DATA ${value['data']}');
 //        return {
 //          'status': 'success',
 //          'message': 'Login successful',
 //          'data': value,
 //        };
 //      }
 //      else if(value['status']=='error') {
 //       return {};
 //      }
 //    });
 //  }
}