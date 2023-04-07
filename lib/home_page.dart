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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Section : ${material!.first.sectionName}'),
                    Text('Category : ${material!.first.subSectionName}'),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Quantity : ${material!.first.quantityType}'),
                    Text('Price : ${material!.first.price}'),
                  ],
                ),
              ],
            );
          }
          else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
