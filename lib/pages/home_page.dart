import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gold_mine/providers/material_provider.dart';
import 'package:provider/provider.dart';

import '../getx/dialoge_class.dart';
import '../models/gold_model.dart';
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
  num weight=0;
  num price=0;
  int _selectedIndex = -1;
  List<String> materialList=['Gold','Silver','Bronch','Diamond','Plutinum','Urenioum'];
  String materials='Gold';
  final DialogeClass myController = Get.put(DialogeClass());
  // List<MaterialPrice> goldList=[
  //   MaterialPrice(
  //       id: 1,
  //       sectionsId: 1,
  //       sectionName: 'Gold',
  //       subSectionsId: 1,
  //       subSectionName: '24k',
  //       weightTypesId: 1,
  //       weightTypeName: 'vori',
  //       price: 1000,
  //       quantity: 1,
  //       quantityType: '1gm'
  //   ),
  //   MaterialPrice(
  //       id: 2,
  //       sectionsId: 2,
  //       sectionName: 'Gold',
  //       subSectionsId: 2,
  //       subSectionName: '22k',
  //       weightTypesId: 1,
  //       weightTypeName: 'vori',
  //       price: 900,
  //       quantity: 1,
  //       quantityType: '1gm'
  //   ),
  //   MaterialPrice(
  //       id: 3,
  //       sectionsId: 3,
  //       sectionName: 'Gold',
  //       subSectionsId: 3,
  //       subSectionName: '20k',
  //       weightTypesId: 1,
  //       weightTypeName: 'vori',
  //       price: 800,
  //       quantity: 1,
  //       quantityType: '1gm'
  //   ),
  //   MaterialPrice(
  //       id: 4,
  //       sectionsId: 4,
  //       sectionName: 'Gold',
  //       subSectionsId: 4,
  //       subSectionName: '18k',
  //       weightTypesId: 1,
  //       weightTypeName: 'vori',
  //       price: 600,
  //       quantity: 1,
  //       quantityType: '1gm'
  //   ),
  //   MaterialPrice(
  //       id: 1,
  //       sectionsId: 1,
  //       sectionName: 'Gold',
  //       subSectionsId: 1,
  //       subSectionName: '24k',
  //       weightTypesId: 1,
  //       weightTypeName: 'vori',
  //       price: 1000,
  //       quantity: 1,
  //       quantityType: '1gm'
  //   ),
  //   MaterialPrice(
  //       id: 2,
  //       sectionsId: 2,
  //       sectionName: 'Gold',
  //       subSectionsId: 2,
  //       subSectionName: '22k',
  //       weightTypesId: 1,
  //       weightTypeName: 'vori',
  //       price: 900,
  //       quantity: 1,
  //       quantityType: '1gm'
  //   ),
  //   MaterialPrice(
  //       id: 3,
  //       sectionsId: 3,
  //       sectionName: 'Gold',
  //       subSectionsId: 3,
  //       subSectionName: '20k',
  //       weightTypesId: 1,
  //       weightTypeName: 'vori',
  //       price: 800,
  //       quantity: 1,
  //       quantityType: '1gm'
  //   ),
  //   MaterialPrice(
  //       id: 4,
  //       sectionsId: 4,
  //       sectionName: 'Gold',
  //       subSectionsId: 4,
  //       subSectionName: '18k',
  //       weightTypesId: 1,
  //       weightTypeName: 'vori',
  //       price: 600,
  //       quantity: 1,
  //       quantityType: '1gm'
  //   ),
  // ];
  // List<MaterialPrice> silverList=[
  //   MaterialPrice(
  //       id: 1,
  //       sectionsId: 1,
  //       sectionName: 'Silver',
  //       subSectionsId: 1,
  //       subSectionName: '24k',
  //       weightTypesId: 1,
  //       weightTypeName: 'vori',
  //       price: 1000,
  //       quantity: 1,
  //       quantityType: '1gm'
  //   ),
  //   MaterialPrice(
  //       id: 2,
  //       sectionsId: 2,
  //       sectionName: 'Silver',
  //       subSectionsId: 2,
  //       subSectionName: '22k',
  //       weightTypesId: 1,
  //       weightTypeName: 'vori',
  //       price: 900,
  //       quantity: 1,
  //       quantityType: '1gm'
  //   ),
  //   MaterialPrice(
  //       id: 3,
  //       sectionsId: 3,
  //       sectionName: 'Silver',
  //       subSectionsId: 3,
  //       subSectionName: '20k',
  //       weightTypesId: 1,
  //       weightTypeName: 'vori',
  //       price: 800,
  //       quantity: 1,
  //       quantityType: '1gm'
  //   ),
  //   MaterialPrice(
  //       id: 4,
  //       sectionsId: 4,
  //       sectionName: 'Silver',
  //       subSectionsId: 4,
  //       subSectionName: '18k',
  //       weightTypesId: 1,
  //       weightTypeName: 'vori',
  //       price: 600,
  //       quantity: 1,
  //       quantityType: '1gm'
  //   ),
  //   MaterialPrice(
  //       id: 1,
  //       sectionsId: 1,
  //       sectionName: 'Silver',
  //       subSectionsId: 1,
  //       subSectionName: '24k',
  //       weightTypesId: 1,
  //       weightTypeName: 'vori',
  //       price: 1000,
  //       quantity: 1,
  //       quantityType: '1gm'
  //   ),
  //   MaterialPrice(
  //       id: 2,
  //       sectionsId: 2,
  //       sectionName: 'Silver',
  //       subSectionsId: 2,
  //       subSectionName: '22k',
  //       weightTypesId: 1,
  //       weightTypeName: 'vori',
  //       price: 900,
  //       quantity: 1,
  //       quantityType: '1gm'
  //   ),
  //   MaterialPrice(
  //       id: 3,
  //       sectionsId: 3,
  //       sectionName: 'Silver',
  //       subSectionsId: 3,
  //       subSectionName: '20k',
  //       weightTypesId: 1,
  //       weightTypeName: 'vori',
  //       price: 800,
  //       quantity: 1,
  //       quantityType: '1gm'
  //   ),
  //   MaterialPrice(
  //       id: 4,
  //       sectionsId: 4,
  //       sectionName: 'Silver',
  //       subSectionsId: 4,
  //       subSectionName: '18k',
  //       weightTypesId: 1,
  //       weightTypeName: 'vori',
  //       price: 600,
  //       quantity: 1,
  //       quantityType: '1gm'
  //   ),
  // ];
  // List<MaterialPrice> dimondList=[
  //   MaterialPrice(
  //       id: 1,
  //       sectionsId: 1,
  //       sectionName: 'Diamond',
  //       subSectionsId: 1,
  //       subSectionName: '24k',
  //       weightTypesId: 1,
  //       weightTypeName: 'vori',
  //       price: 1000,
  //       quantity: 1,
  //       quantityType: '1gm'
  //   ),
  //   MaterialPrice(
  //       id: 2,
  //       sectionsId: 2,
  //       sectionName: 'Diamond',
  //       subSectionsId: 2,
  //       subSectionName: '22k',
  //       weightTypesId: 1,
  //       weightTypeName: 'vori',
  //       price: 900,
  //       quantity: 1,
  //       quantityType: '1gm'
  //   ),
  //   MaterialPrice(
  //       id: 3,
  //       sectionsId: 3,
  //       sectionName: 'Diamond',
  //       subSectionsId: 3,
  //       subSectionName: '20k',
  //       weightTypesId: 1,
  //       weightTypeName: 'vori',
  //       price: 800,
  //       quantity: 1,
  //       quantityType: '1gm'
  //   ),
  //   MaterialPrice(
  //       id: 4,
  //       sectionsId: 4,
  //       sectionName: 'Diamond',
  //       subSectionsId: 4,
  //       subSectionName: '18k',
  //       weightTypesId: 1,
  //       weightTypeName: 'vori',
  //       price: 600,
  //       quantity: 1,
  //       quantityType: '1gm'
  //   ),
  //   MaterialPrice(
  //       id: 1,
  //       sectionsId: 1,
  //       sectionName: 'Diamond',
  //       subSectionsId: 1,
  //       subSectionName: '24k',
  //       weightTypesId: 1,
  //       weightTypeName: 'vori',
  //       price: 1000,
  //       quantity: 1,
  //       quantityType: '1gm'
  //   ),
  //   MaterialPrice(
  //       id: 2,
  //       sectionsId: 2,
  //       sectionName: 'Diamond',
  //       subSectionsId: 2,
  //       subSectionName: '22k',
  //       weightTypesId: 1,
  //       weightTypeName: 'vori',
  //       price: 900,
  //       quantity: 1,
  //       quantityType: '1gm'
  //   ),
  //   MaterialPrice(
  //       id: 3,
  //       sectionsId: 3,
  //       sectionName: 'Diamond',
  //       subSectionsId: 3,
  //       subSectionName: '20k',
  //       weightTypesId: 1,
  //       weightTypeName: 'vori',
  //       price: 800,
  //       quantity: 1,
  //       quantityType: '1gm'
  //   ),
  //   MaterialPrice(
  //       id: 4,
  //       sectionsId: 4,
  //       sectionName: 'Diamond',
  //       subSectionsId: 4,
  //       subSectionName: '18k',
  //       weightTypesId: 1,
  //       weightTypeName: 'vori',
  //       price: 600,
  //       quantity: 1,
  //       quantityType: '1gm'
  //   ),
  // ];
  List<MaterialPrice> showItemList=[];

  @override
  void dispose() {
    myController.dispose();
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
        appBar: AppBar(
          toolbarHeight: 100,
          centerTitle: true,
          title: Column(
            children: [
              Text('Welcome to Goldmine',style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
              Text('$materials',style: TextStyle(fontSize: 20),),
              //Text('Price of ${vori} vori is ${price}',style: TextStyle(fontSize: 16),)
            ],
          ),
        ),
        body: Consumer<MaterialProvider>(
          builder: (context,provider,_)=>FutureBuilder(
            future: provider.getMaterialInfo(context,'3'),
            builder: (context,snapshot){
              if(snapshot.hasData){
                final dataList=snapshot.data;
                return SingleChildScrollView(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(height: 10,),
                          SizedBox(
                            height: 60.0,

                            child: ListView.builder(
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: materialList.length,
                              itemBuilder: (BuildContext context, int index) => Card(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedIndex = index;
                                      materials=materialList[index];
                                      // Update the selected item index
                                    });

                                    if(materials=='Gold'){
                                      setState(() {
                                        showItemList.clear();
                                        showItemList.addAll(provider.materialPriceList);
                                      });
                                    }
                                    // if(materials=='Silver'){
                                    //   setState(() {
                                    //     showItemList.clear();
                                    //     showItemList.addAll(silverList);
                                    //   });
                                    // }
                                    // if(materials=='Diamond'){
                                    //   setState(() {
                                    //     showItemList.clear();
                                    //     showItemList.addAll(dimondList);
                                    //   });
                                    // }
                                  },
                                  child: Container(
                                    width: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Colors.white,
                                      border: Border.all(
                                        color: _selectedIndex == index
                                            ? Color(0xffda9100) // Color of the selected item
                                            : Colors.white,
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(materialList[index],
                                        style: TextStyle(
                                            fontWeight: _selectedIndex == index?FontWeight.bold:FontWeight.normal,
                                            color: _selectedIndex == index?Color(0xffda9100):Colors.black,
                                            fontSize: _selectedIndex == index?15:14
                                        )
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Material Information',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Number of columns
                              crossAxisSpacing: 10.0, // Spacing between columns
                              mainAxisSpacing: 10.0, // Spacing between rows
                            ),
                            itemCount: dataList!.length, // Number of items in the grid
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: (){
                                  // _showBottomSheet(context);
                                  showDialog(context: context, builder: (context){

                                         var changeWeight=num.parse(dataList[index].quantity??'');
                                         var changePrice=num.parse(dataList[index].price??'');
                                          return Obx(() {

                                            return AlertDialog(
                                              title: Text(dataList[index].sectionName!),
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
                                                          myController.getTotalPrice(value,dataList[index].price!);
                                                          // changeWeight=int.parse(value);
                                                          // changePrice=changeWeight*double.parse(dataList[index].price!);
                                                          // print('weight ${changeWeight} Price ${changePrice}');
                                                        }
                                                        // print('price ${price}');
                                                      },
                                                      decoration: InputDecoration(
                                                        labelText: 'Quantity (gm)',
                                                        border: OutlineInputBorder(),
                                                        suffixIcon: Icon( Icons.info,),  ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Text('Section : ${dataList[index].sectionName??''}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                                                      SizedBox(height: 5,),
                                                      Text('Category : ${dataList[index].subSectionName}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),)
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
                                                  Text('Price of ${myController.weight} ${dataList[index].weightTypeName} is ${myController.totalPrice} BDT'),
                                                  SizedBox(height: 20,),
                                                ],
                                              ),
                                            );
                                          });
                                  });
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      // Replace with your own item widget
                                      child: Card(
                                        elevation: 6,
                                        child: Center(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text('${dataList[index].subSectionName}',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                                              SizedBox(height: 5,),
                                              Text('1gm =${dataList[index].price} Tk'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.camera_sharp,color: Colors.red,),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
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
                    ));
              }
              else return Center(child: CircularProgressIndicator());
            }
          ),
        ));
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
