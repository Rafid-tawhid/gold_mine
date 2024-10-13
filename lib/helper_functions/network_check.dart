import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Network{
  static String status='Waiting';
 static Connectivity _connectivity=Connectivity();

  static Future<String> checkConnectivity() async{

    var connectionResult= await _connectivity.checkConnectivity();
    if(connectionResult==ConnectivityResult.mobile){
      status='Mobile Data';
    }
    else if(connectionResult==ConnectivityResult.wifi){
      status='Wifi Data';
    }
    else {
      status='Not Connected';
    }

    return status;
  }
 static void showNotConnectedDialog(BuildContext context) {
   Future.delayed(
       Duration(
         milliseconds: 500,
       ), () {
     if (Network.status == 'Not Connected') {
       showDialog(
           context: context,
           builder: (context) {
             return AlertDialog(
               content: Text('Please Check your Internet Connection'),
               actions: [
                 ElevatedButton(
                     onPressed: () {
                       Navigator.pop(context);
                       SystemNavigator.pop();
                     },
                     child: Text('Cancel'))
               ],
             );
           });
     } else {
       // showSeipPopUp();
     }
   });
  }
  static Future<bool> isConnectedToInternet() async{
    var result = await (Connectivity().checkConnectivity());

    return result==ConnectivityResult.mobile||result==ConnectivityResult.wifi;
  }
}