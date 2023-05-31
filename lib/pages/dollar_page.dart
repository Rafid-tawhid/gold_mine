import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gold_mine/providers/doller_provider.dart';
import 'package:provider/provider.dart';

import '../getx/dialoge_class.dart';
import '../models/materials_model.dart';
import '../providers/material_provider.dart';

class DollarPage extends StatefulWidget {
  const DollarPage({Key? key}) : super(key: key);

  @override
  State<DollarPage> createState() => _DollarPageState();
}

class _DollarPageState extends State<DollarPage> {




  @override
  void didChangeDependencies() {

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
          builder: (context,provider,_)=>FutureBuilder(
            future: provider.getAllDollerInfo(),
            builder: (context,snapshot){
              final country=snapshot.data;
              if(snapshot.hasData){
                return ListView(
                  children: country!.map((e) => ListTile(title: Text(e.country??''),)).toList()
                );
              }
              else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),

    );
  }

}

