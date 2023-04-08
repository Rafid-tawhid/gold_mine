import 'package:flutter/cupertino.dart';
import 'package:gold_mine/api_calls.dart';
import 'package:gold_mine/gold_model.dart';

class MaterialProvider extends ChangeNotifier{

  List<MaterialPrice> materialPriceList=[];

 Future<List<MaterialPrice>?> getMaterialPriceInfo() async{
   await ApiCalls.getMaterialPriceInfo().then((value) {
      
      if(value!=null){
        for(var i in value['materialPrice']){
          materialPriceList.add(MaterialPrice.fromJson(i));
        }

      }
    });

   return materialPriceList;
  }
}