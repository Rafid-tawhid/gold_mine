import 'package:flutter/cupertino.dart';
import 'package:gold_mine/api_calls/api_calls.dart';
import 'package:gold_mine/models/gold_model.dart';
import 'package:gold_mine/widgets/my_dialoge.dart';

class MaterialProvider extends ChangeNotifier{

  List<MaterialPrice> materialPriceList=[];

 Future<List<MaterialPrice>> getMaterialInfo(BuildContext context,String pageNo) async{
   print('Called........');
   materialPriceList.clear();
   await ApiCalls.getMaterialInfo(pageNo).then((value) {
      if(value['status']=='success'){
        final data=value['data'];
       print('MY VAL ${data['materialPrice']}');

       // materialPriceList.addAll(data['materialPrice']);
        final db=data['materialPrice'];
        for(Map i in data['materialPrice']){
          materialPriceList.add(MaterialPrice.fromJson(i));
        }
        print('materialPriceList ${materialPriceList.first.sectionName}');

      }
      else {
        MyDialogs.serverErrorDialoge(context, 'Server Problem', 'Please wait and try again later.. ');
      }
    });

   return materialPriceList;
  }
}