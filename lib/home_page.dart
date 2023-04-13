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
  int _selectedIndex = -1;
  List<String> materialList=['Gold','Silver','Bronch','Diamond','Plutinum','Urenioum'];
  String materials='Gold';

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
            Text('1 gm : 1000 BDT',style: TextStyle(fontSize: 16),)
          ],
        ),
        
      ),
      body: SingleChildScrollView(
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
                        materials=materialList[index];// Update the selected item index
                      });
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
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,// Number of columns in the grid
              children: List.generate(
                20, // Total number of items in the grid
                    (index) => InkWell(
                      onTap: (){
                        // _showBottomSheet(context);
                        showDialog(context: context, builder: (context)=>AlertDialog(
                          title: Text('Gold'),
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
                                      vori=double.parse(textCon.text);
                                      // price=vori*material!.first.price!;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Gold Quantity',

                                    border: OutlineInputBorder(),
                                    suffixIcon: Icon( Icons.info,),  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Section : ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                                  Text('Category : ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),)
                                ],
                              ),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Quantity : ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,)),
                                  Text('Price : ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,)),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Text('Price of $vori is $price'),
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
                                Text('${index+17}K',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                                SizedBox(height: 5,),
                                Text('1gm =${1000+index} Tk'),
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
                    ),
              ),
            ),
          ],
        ),
      ),


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
          FutureBuilder(
              future: provider.getMaterialPriceInfo(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  var material=snapshot.data;
                  return Column(
                    children: [
                      // SizedBox(height: 60,),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     Text('Section : ${material!.first.sectionName}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                      //     Text('Category : ${material!.first.subSectionName}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),)
                      //   ],
                      // ),
                      // SizedBox(height: 20,),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     Text('Quantity : ${material!.first.quantityType}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,)),
                      //     Text('Price : ${material!.first.price}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,)),
                      //   ],
                      // ),
                      // SizedBox(height: 20,),
                      // Text('Price of $vori ${material.first.sectionName} is $price'),
                      // SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: TextField(
                          controller: textCon,
                          keyboardType: TextInputType.phone,

                          onChanged: (value){
                            setState(() {
                              vori=double.parse(textCon.text);
                              price=vori*material!.first.price!;
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
            )
            ],
          ),
        );
      },
    );
  }
}
