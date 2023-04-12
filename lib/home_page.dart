import 'package:flutter/material.dart';
import 'package:gold_mine/material_provider.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

class GoldPage extends StatefulWidget {
  static const String routeName='/gold';
  const GoldPage({Key? key}) : super(key: key);


  @override
  State<GoldPage> createState() => _GoldPageState();
}

class _GoldPageState extends State<GoldPage> {

  late MaterialProvider provider;
  final textCon =TextEditingController();
  double vori=0;
  double price=0;

  @override
  void dispose() {
    textCon.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {

    provider=Provider.of(context,listen: true);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: provider.getMaterialPriceInfo(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var material=snapshot.data;
            return Column(
              children: [
                SizedBox(height: 60,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Section : ${material!.first.sectionName}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                    Text('Category : ${material!.first.subSectionName}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),)
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Quantity : ${material!.first.quantityType}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,)),
                    Text('Price : ${material!.first.price}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,)),
                  ],
                ),
                SizedBox(height: 20,),
                Text('Price of $vori ${material.first.sectionName} is $price'),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: TextField(
                    controller: textCon,
                    keyboardType: TextInputType.phone,

                    onChanged: (value){
                      setState(() {
                        vori=double.parse(textCon.text);
                        price=vori*material.first.price!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Gold Quantity',

                      border: OutlineInputBorder(),
                      suffixIcon: Icon( Icons.info,),  ),
                  ),
                ),
              ],
            );
          }
          else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
