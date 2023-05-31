import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gold_mine/models/dollaer_model.dart';
import 'package:gold_mine/providers/doller_provider.dart';
import 'package:provider/provider.dart';

import '../getx/dialoge_class.dart';
import '../models/materials_model.dart';
import '../providers/material_provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
class DollarPage extends StatefulWidget {
  const DollarPage({Key? key}) : super(key: key);

  @override
  State<DollarPage> createState() => _DollarPageState();
}

class _DollarPageState extends State<DollarPage> {

  late DollerProvider dollerProvider;
  late Country selectedCountry;
  final dollarCon =TextEditingController();
  final currencyCon =TextEditingController();

  @override
  void dispose() {
    dollarCon.dispose();
    currencyCon.dispose();
    super.dispose();
  }
  @override
  void didChangeDependencies() {
    dollerProvider= Provider.of(context,listen: false);
    selectedCountry=dollerProvider.dollerInfoList.firstWhere((element) => element.country=='Bangladesh');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          centerTitle: true,
          title: const Column(
            children: [
              Text('Welcome to Goldmine',style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
              Text('Doller Rate',style: TextStyle(fontSize: 20),),
              //Text('Price of ${vori} vori is ${price}',style: TextStyle(fontSize: 16),)
            ],
          ),
        ),
        body: Consumer<DollerProvider>(
          builder: (context,provider,_)=>Center(
            child: Column(
              children: [
                SizedBox(height: 30,),
                DropdownButton2<Country>(
                  value: selectedCountry,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCountry = newValue!;
                      dollarCon.text='';
                      currencyCon.text='';
                    });
                    print(selectedCountry.country);
                    print(selectedCountry.rate);
                  },
                  items: provider.dollerInfoList.map((Country object) {
                    return DropdownMenuItem<Country>(
                      value: object,
                      child: Text(object.country??''),
                    );
                  }).toList(),
                ),
                SizedBox(height: 10,),
                Text('1 Doller(USD) =${selectedCountry.rate}'),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextFormField(
                    controller: dollarCon,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter Dollar',
                        border: OutlineInputBorder()
                    ),
                    onChanged: (val){
                      setState(() {
                        currencyCon.text=(int.parse(val)*selectedCountry.rate!.toInt()).toStringAsFixed(2);
                      });
                    },
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextFormField(
                    controller: currencyCon,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Enter Amount',
                      border: OutlineInputBorder()
                    ),
                    onChanged: (val){
                      setState(() {
                        dollarCon.text=(int.parse(val)/selectedCountry.rate!.toInt()).toStringAsFixed(2);
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),

    );
  }

}

