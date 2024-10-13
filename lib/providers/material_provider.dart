import 'package:flutter/cupertino.dart';
import 'package:gold_mine/api_calls/api_calls.dart';
import 'package:gold_mine/models/materials_model.dart';
import 'package:gold_mine/models/section_model.dart';
import 'package:gold_mine/widgets/my_dialoge.dart';

class MaterialProvider extends ChangeNotifier{

  List<MaterialsModel> materialsInfoList=[];
  List<Sections> sectionsName=[];
  bool goldLoading=false;


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

 Future<List<MaterialsModel>> getMaterialInfo(String idNo) async{
   print('Called........');
   materialsInfoList.clear();

   showLoading(true);

   await ApiCalls.getMaterialInfo(idNo).then((value) {
      if(value['status']=='success'){
        final data=value['data'];
       debugPrint('MY VAL ${data['materialPrice']}');
        for(Map i in data['materialPrice']){
          materialsInfoList.add(MaterialsModel.fromJson(i));
        }

      }
      else {
       // MyDialogs.serverErrorDialoge(context, 'Server Problem', 'Please wait and try again later.. ');
      }
    });
   showLoading(false);
   debugPrint('materialsInfoList ${materialsInfoList.length}');
   return materialsInfoList;
  }

  void showLoading(bool bool) {
    goldLoading=bool;
    notifyListeners();
  }
}