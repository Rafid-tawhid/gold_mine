import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gold_mine/helper_functions/constants.dart';
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
  late DollerProvider dollarprovider;


  @override
  void initState() {
    callAllRateInfo();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    dollarprovider=Provider.of(context,listen: true);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 100,
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: myColor.primary,
          title: const Column(
            children: [
              Text('Welcome to Goldmine',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight:FontWeight.bold),),
              SizedBox(height: 10,),
              Text('Doller Rate',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight:FontWeight.bold),),
              //Text('Price of ${vori} vori is ${price}',style: TextStyle(fontSize: 16),)
            ],
          ),
        ),
        body:dollarprovider.showLoading? Center(child: CircularProgressIndicator(color: myColor.primary,),):
        ListView(
            children: dollarprovider.dollerInfoList.map((e) => CountryInfoCard (countryInfo: e.toJson(),)).toList()
        )

    );
  }

  void callAllRateInfo() {
    var pro=context.read<DollerProvider>();
    if(pro.dollerInfoList.isEmpty){
      Future.microtask((){
        pro.getAllDollerInfo();
      });
    }
  }

}



class CountryInfoCard extends StatelessWidget {
  final Map<String, dynamic> countryInfo;

  CountryInfoCard({required this.countryInfo});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      margin: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Country flag
                Image.network(
                  countryInfo['countryimg'],
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                // Country name and code
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      countryInfo['country'] ?? 'Unknown Country',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Code: ${countryInfo['code']} (${countryInfo['alpha_3']})",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Capital and continent
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    'Capital: ${countryInfo['capital'] ?? 'N/A'}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Text(
                  'Continent: ${countryInfo['continent']}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Currency and rates
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Currency: ${countryInfo['currency']} (${countryInfo['currency_code']})',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Rate: ${countryInfo['rate'].toString()}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Phone code and dollar rate
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Phone Code: +${countryInfo['phone'].toString()}',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Dollar Rate: ${countryInfo['dollar_rate']}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Active status
            Row(
              children: [
                const Text(
                  'Status: ',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  countryInfo['active'] ? 'Active' : 'Inactive',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: countryInfo['active'] ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
