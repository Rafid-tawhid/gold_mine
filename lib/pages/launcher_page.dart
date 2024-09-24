


import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gold_mine/widgets/home.dart';
import 'package:gold_mine/widgets/my_dialoge.dart';
import 'package:provider/provider.dart';

import '../api_calls/api_calls.dart';
import '../helper_functions/network_check.dart';
import '../helper_functions/set_user_info.dart';
import '../models/login_info_model.dart';
import '../providers/material_provider.dart';


class LauncherPage extends StatefulWidget {

  static const String routeName='/';
  const LauncherPage({Key? key}) : super(key: key);

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {


  late MaterialProvider provider;
  late Connectivity _connectivity;
  late Stream<ConnectivityResult> _connectivityStream;

  @override
  void initState() {
    super.initState();
    _connectivity = Connectivity();
    _connectivityStream = _connectivity.onConnectivityChanged;
    _checkInitialConnection();
    _listenForConnectionChanges();
  }


  Future<void> _checkInitialConnection() async {
    var initialResult = await _connectivity.checkConnectivity();
    if (initialResult == ConnectivityResult.none) {
      ShowNoNetworkDialoge();
    }
  }

  void _listenForConnectionChanges() {
    _connectivityStream.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        ShowNoNetworkDialoge();
      } else if (result != ConnectivityResult.none) {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
      }
    });
  }



  @override
  void didChangeDependencies() {
    provider=Provider.of(context,listen: false);
    Network.checkConnectivity();
    Future.delayed(
        const Duration(
          milliseconds: 200,
        ), () {

      if (Network.status == 'Not Connected') {
        ShowNoNetworkDialoge();
      } else {
        // showSeipPopUp();
      }
    });








    //dynamic app settings

    // subscription = Connectivity().onConnectivityChanged.listen((result) {
    //   print('Listening.................');
    //   if (result == ConnectivityResult.wifi ||
    //       result == ConnectivityResult.mobile) {
    //       EasyLoading.show();
    //       provider=Provider.of(context,listen: false);
    //
    //     // get app basic settings
    //     userProfileProvider.getAppSettings().then((value) {
    //
    //
    //       // set app settings
    //       userProfileProvider.basicSettingsList.forEach((element) {
    //         if(element.fieldKey=='app_title'){
    //
    //           AdminAccessConfig.appName=element.fieldValue;
    //         }
    //         if(element.fieldKey=='api_url'){
    //           AdminAccessConfig.base_url=element.fieldValue;
    //         }
    //       });
    //       print('AdminAccessConfig.appName ${AdminAccessConfig.appName}');
    //       print('AdminAccessConfig.base_url ${AdminAccessConfig.base_url}');
    //
    //       //CALL All country charges info
    //       provider.getserviceChargeofAllCountry().then((value) {
    //         EasyLoading.dismiss();
    //         if(value.length>0){
    //           print('value.length Called.... ${value.length}');
    //           Navigator.pushNamed(context, LoginPage.routeName);
    //         }
    //         else {
    //           EasyLoading.dismiss();
    //           ShowErrorDialoge(context);
    //         }
    //       });
    //     });
    //
    //   } else {
    //     setState(() {
    //       ShowNoNetworkDialoge();
    //     });
    //   }
    // });

    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      backgroundColor: Color(0xff26A6DE),
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image.asset('images/logo_circle.png'),
              // SizedBox(height: 60,),
              // Center(
              //   child: LoadingAnimationWidget.staggeredDotsWave(
              //     size: 40, color: Colors.white,
              //   ),
              // ),
              Text('Loading...',style: TextStyle(color: Colors.white),),
              // SizedBox(height: 20,),
              // SizedBox(
              //   width: 120, // Set the width of the progress indicator
              //   height: 4, // Set the height of the progress indicator
              //   child: LinearProgressIndicator(
              //     backgroundColor: Colors.white, // Background color of the progress bar
              //     valueColor: AlwaysStoppedAnimation<Color>(MyColor.blue), // Color of the progress bar
              //     value: loadingVal/15,
              //     semanticsLabel: 'Loading...',
              //     semanticsValue: 'Loading...',// Value is set to null to display the animated progress indicator
              //   ) // Display the loading line
              // ),

            ],
          )
      ),
    );
  }
  void ShowNoNetworkDialoge() {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Network problem.'),
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.wifi_off, size: 60,),
                Text('Please Check your Internet Connection'),
              ],
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    SystemNavigator.pop();
                  },
                  child: const Text('Cancel'))
            ],
          );
        });
  }}


