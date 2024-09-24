import 'package:flutter/cupertino.dart';
import 'package:gold_mine/api_calls/api_calls.dart';
import 'package:gold_mine/models/materials_model.dart';
import 'package:gold_mine/models/section_model.dart';
import 'package:gold_mine/widgets/my_dialoge.dart';

class MaterialProvider extends ChangeNotifier{

  List<MaterialPrice> materialsInfoList=[];
  List<Sections> sectionsName=[];


  Future<List<Sections>> getSectionsName()async {

    sectionsName.clear();
    await ApiCalls.getSection().then((value) {

      if(value!=null){
        if(value['response']=='success') {
          final data=value['data'];

          if(data['status']==true){

            for(Map i in data['sections']){
              sectionsName.add(Sections.fromJson(i));
            }
          }
          else {
           // MyDialogs.serverErrorDialoge(context, 'Server Problem', 'Please wait and try again later.. 1');
          }
        }
        else {
         // MyDialogs.serverErrorDialoge(context, 'Server Problem', 'Please wait and try again later.. 2');
        }
      }
      else {
       // MyDialogs.serverErrorDialoge(context, 'Server Problem', 'Please wait and try again later.. 3');
      }
    });

    return sectionsName;
  }

 Future<List<MaterialPrice>> getMaterialInfo(String idNo) async{
   print('Called........');
   materialsInfoList.clear();
   await ApiCalls.getMaterialInfo(idNo).then((value) {
      if(value['status']=='success'){
        final data=value['data'];
       print('MY VAL ${data['materialPrice']}');

        for(Map i in data['materialPrice']){
          materialsInfoList.add(MaterialPrice.fromJson(i));
        }
        notifyListeners();

      }
      else {
       // MyDialogs.serverErrorDialoge(context, 'Server Problem', 'Please wait and try again later.. ');
      }
    });

   return materialsInfoList;
  }
}