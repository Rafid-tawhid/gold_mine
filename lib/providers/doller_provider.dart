import 'package:flutter/cupertino.dart';

import '../api_calls/api_calls.dart';
import '../models/dollaer_model.dart';
import '../widgets/my_dialoge.dart';

class DollerProvider extends ChangeNotifier {

  List<DollaerModel> dollerInfoList=[];

  Future<List<DollaerModel>> getAllDollerInfo() async{
    print('Called........');
    dollerInfoList.clear();
    await ApiCalls.getDollarInfo().then((value) {
      if(value['status']=='success'){
        final data=value['data'];
        // print('All Countryss ${data['countries']}');

        for(var i in data['country']){
          dollerInfoList.add(DollaerModel.fromJson(i));
        }
        notifyListeners();

      }
      else {
       // MyDialogs.serverErrorDialoge(context, 'Server Problem', 'Please wait and try again later.. ');
      }
    });
    print('dollerInfoList ${dollerInfoList.length}');

    return dollerInfoList;
  }
}