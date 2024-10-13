import 'package:flutter/cupertino.dart';

import '../api_calls/api_calls.dart';
import '../models/dollaer_model.dart';
import '../widgets/my_dialoge.dart';

class DollerProvider extends ChangeNotifier {

  List<DollaerModel> dollerInfoList=[];
  bool showLoading=false;

  Future<List<DollaerModel>> getAllDollerInfo() async{
    print('Called........');
    showLoadingBtn(true);
    dollerInfoList.clear();
    await ApiCalls.getDollarInfo().then((value) {
      if(value['status']=='success'){
        final data=value['data'];
        // print('All Countryss ${data['countries']}');

        for(var i in data['country']){
          dollerInfoList.add(DollaerModel.fromJson(i));
        }
      }
      else {
       // MyDialogs.serverErrorDialoge(context, 'Server Problem', 'Please wait and try again later.. ');
      }
    });
    print('dollerInfoList ${dollerInfoList.length}');

    showLoadingBtn(false);
    return dollerInfoList;
  }

  void showLoadingBtn(bool bool) {
    showLoading=bool;
    notifyListeners();
  }
}