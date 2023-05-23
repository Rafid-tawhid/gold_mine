import 'package:flutter/material.dart';
import 'package:gold_mine/providers/material_provider.dart';
import 'package:provider/provider.dart';

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
  num vori=0;
  num price=0;
  int _selectedIndex = -1;
  List<String> materialList=['Gold','Silver','Bronch','Diamond','Plutinum','Urenioum'];
  String materials='Gold';
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
              Text('Price of ${vori} vori is ${price}',style: TextStyle(fontSize: 16),)
            ],
          ),
        ),
        body: Consumer<MaterialProvider>(
          builder: (context,provider,_)=>FutureBuilder(
            future: provider.getMaterialInfo(context,'3'),
            builder: (context,snapshot){
              if(snapshot.hasData){
                final dataList=snapshot.data;
                provider.getMaterialInfo(context,'3').then((value){
                  print('RETURN VALUE IS ${value.first.toJson()}');
                });
                //
                // print('dataList!.first.toString() ${dataList!.first.toString()}');
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
                                  showDialog(context: context, builder: (context)=>AlertDialog(
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
                                              setState(() {
                                                vori=int.parse(textCon.text);
                                                price=int.parse(dataList[index].price!*vori.toInt());
                                              //
                                              });
                                            },
                                            decoration: InputDecoration(
                                              labelText: 'Gold Quantity',

                                              border: OutlineInputBorder(),
                                              suffixIcon: Icon( Icons.info,),  ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text('Section : ${showItemList[index].sectionName}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                                            SizedBox(height: 5,),
                                            Text('Category : ${showItemList[index].subSectionName}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),)
                                          ],
                                        ),
                                        SizedBox(height: 5,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text('Quantity : ${showItemList[index].quantity}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,)),
                                            Text('Price : ${showItemList[index].price}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,)),
                                          ],
                                        ),
                                        SizedBox(height: 20,),
                                        Text('Price of ${vori} vori is ${price}'),
                                        SizedBox(height: 20,),
                                      ],
                                    ),
                                  ));
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
