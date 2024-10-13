import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:gold_mine/providers/material_provider.dart';
import 'package:provider/provider.dart';

import '../getx/dialoge_class.dart';
import '../models/materials_model.dart';
import '../providers/doller_provider.dart';
// import 'package:provider/provider.dart';

class GoldPage extends StatefulWidget {
  static const String routeName='/gold';
  const GoldPage({Key? key}) : super(key: key);


  @override
  State<GoldPage> createState() => _GoldPageState();
}


class _GoldPageState extends State<GoldPage> {

  late MaterialProvider provider;
  late DollerProvider dollarprovider;
  final textCon =TextEditingController();
  num weight=0;
  bool calledOnce=true;
  num price=0;
  int _selectedIndex = -1;
  String materials='Gold';
  final DialogeClass myController = Get.put(DialogeClass());
  List<MaterialsModel> showItemList=[];
  @override
  void dispose() {

    textCon.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {

    provider=Provider.of(context,listen: true);
    dollarprovider=Provider.of(context,listen: false);
    if(calledOnce){
      _selectedIndex=0;
     Future.microtask((){
       provider.getMaterialInfo('1').then((value) {});
     });

    }
    calledOnce=false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 100,
          centerTitle: true,
          title: Column(
            children: [
              const Text('Welcome to Goldmine',style: TextStyle(fontSize: 20),),
              const SizedBox(height: 10,),
              Text(materials,style: const TextStyle(fontSize: 20),),
              //Text('Price of ${vori} vori is ${price}',style: TextStyle(fontSize: 16),)
            ],
          ),
        ),

        body: Consumer<MaterialProvider>(
          builder: (context,provider,_)=>provider.goldLoading?const Center(child: CircularProgressIndicator(),):
          SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(height: 10,),
                    SizedBox(
                      height: 60.0,
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: provider.sectionsName.length,
                        itemBuilder: (BuildContext context, int index) => Card(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                                materials=provider.sectionsName[index].name??'';
                                // Update the selected item index
                              });
                              EasyLoading.show();
                              provider.getMaterialInfo(provider.sectionsName[index].id.toString()).then((value) {
                                EasyLoading.dismiss();
                              });

                            },
                            child: Container(
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: _selectedIndex == index?Color(0xff0f4c81):Colors.white,
                                border: Border.all(
                                  color: _selectedIndex == index
                                      ? Colors.black // Color of the selected item
                                      : Colors.white,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(provider.sectionsName[index].name??'',
                                  style: TextStyle(
                                      fontWeight: _selectedIndex == index?FontWeight.bold:FontWeight.normal,
                                      color: _selectedIndex == index?Colors.white:Colors.black,
                                      fontSize: _selectedIndex == index?15:14
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Material Information',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                   provider.materialsInfoList.isNotEmpty? Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                     child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns
                          // Spacing between columns
                          // Spacing between rows
                        ),
                        itemCount: provider.materialsInfoList.length, // Number of items in the grid
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: (){
                              // _showBottomSheet(context);
                              showDialog(context: context, builder: (context){
                                //set controler
                                textCon.text='1';
                                //default weight 1
                                myController.getTotalPrice('1',provider.materialsInfoList[index].price.toString());

                                return Obx(() {

                                  return AlertDialog(
                                    title: Text(provider.materialsInfoList[index].sectionName!),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: TextField(
                                            controller: textCon,
                                            keyboardType: TextInputType.phone,

                                            onChanged: (value){
                                              if(value.isNotEmpty){
                                                myController.getTotalPrice(value,provider.materialsInfoList[index].price.toString());
                                                // changeWeight=int.parse(value);
                                                // changePrice=changeWeight*double.parse(dataList[index].price!);
                                                // print('weight ${changeWeight} Price ${changePrice}');
                                              }
                                              // print('price ${price}');
                                            },
                                            decoration: const InputDecoration(
                                              labelText: 'Quantity (gm)',
                                              border: OutlineInputBorder(),
                                              suffixIcon: Icon( Icons.info,),  ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text('Section : ${provider.materialsInfoList[index].sectionName??''}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                                            SizedBox(height: 5,),
                                            Text('Category : ${provider.materialsInfoList[index].subSectionName}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),)
                                          ],
                                        ),
                                        SizedBox(height: 5,),
                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        //   children: [
                                        //     Text('Quantity : ${dataList[index].quantity}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,)),
                                        //     Text('Price : ${dataList[index].price}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,)),
                                        //   ],
                                        // ),
                                        SizedBox(height: 20,),
                                        Text('Price of ${myController.weight} ${provider.materialsInfoList[index].weightTypeName} is ${myController.totalPrice} BDT'),
                                        SizedBox(height: 20,),
                                      ],
                                    ),
                                  );
                                });
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: [
                                  Card(
                                    elevation: 6,
                                    child: Center(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text('${provider.materialsInfoList[index].subSectionName}',style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                                          const SizedBox(height: 5,),
                                          Text('1gm =${provider.materialsInfoList[index].price} Tk'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.camera_sharp,color: Color(0xff0f4c81),),
                                  )
                                ],
                              ),
                            ),
                          );
                        },

                      ),
                   ):
                   const Center(child: Text('No Data Found'),),
                  ]

                // body: FutureBuilder(
                //   future: provider.getMaterialPriceInfo(),
                //   builder: (context,snapshot){
                //     if(snapshot.hasData){
                //       var material=snapshot.data;
                //       return Column(
                //         children: [
                //           SizedBox(height: 60,),
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //             children: [
                //               Text('Section : ${material!.first.sectionName}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                //               Text('Category : ${material!.first.subSectionName}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),)
                //             ],
                //           ),
                //           SizedBox(height: 20,),
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //             children: [
                //               Text('Quantity : ${material!.first.quantityType}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,)),
                //               Text('Price : ${material!.first.price}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,)),
                //             ],
                //           ),
                //           SizedBox(height: 20,),
                //           Text('Price of $vori ${material.first.sectionName} is $price'),
                //           SizedBox(height: 20,),
                //           Padding(
                //             padding: const EdgeInsets.all(14.0),
                //             child: TextField(
                //               controller: textCon,
                //               keyboardType: TextInputType.phone,
                //
                //               onChanged: (value){
                //                 setState(() {
                //                   vori=double.parse(textCon.text);
                //                   price=vori*material.first.price!;
                //                 });
                //               },
                //               decoration: InputDecoration(
                //                 labelText: 'Gold Quantity',
                //
                //                 border: OutlineInputBorder(),
                //                 suffixIcon: Icon( Icons.info,),  ),
                //             ),
                //           ),
                //         ],
                //       );
                //     }
                //     else {
                //       return Center(child: CircularProgressIndicator());
                //     }
                //   },
                // ),
              ))
        )
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'This is a bottom sheet',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // FutureBuilder(
              //   future: provider.getMaterialPriceInfo(),
              //   builder: (context,snapshot){
              //     if(snapshot.hasData){
              //       var material=snapshot.data;
              //       return Column(
              //         children: [
              //           // SizedBox(height: 60,),
              //           // Row(
              //           //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           //   children: [
              //           //     Text('Section : ${material!.first.sectionName}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
              //           //     Text('Category : ${material!.first.subSectionName}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),)
              //           //   ],
              //           // ),
              //           // SizedBox(height: 20,),
              //           // Row(
              //           //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           //   children: [
              //           //     Text('Quantity : ${material!.first.quantityType}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,)),
              //           //     Text('Price : ${material!.first.price}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,)),
              //           //   ],
              //           // ),
              //           // SizedBox(height: 20,),
              //           // Text('Price of $vori ${material.first.sectionName} is $price'),
              //           // SizedBox(height: 20,),
              //           Padding(
              //             padding: const EdgeInsets.all(14.0),
              //             child: TextField(
              //               controller: textCon,
              //               keyboardType: TextInputType.phone,
              //
              //               onChanged: (value){
              //                 setState(() {
              //                   vori=double.parse(textCon.text);
              //                   price=vori*material!.first.price!;
              //                 });
              //               },
              //               decoration: InputDecoration(
              //                 labelText: 'Gold Quantity',
              //
              //                 border: OutlineInputBorder(),
              //                 suffixIcon: Icon( Icons.info,),  ),
              //             ),
              //           ),
              //         ],
              //       );
              //     }
              //     else {
              //       return Center(child: CircularProgressIndicator());
              //     }
              //   },
              // )
            ],
          ),
        );
      },
    );
  }
}
