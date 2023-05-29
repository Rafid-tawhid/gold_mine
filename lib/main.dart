import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gold_mine/pages/launcher_page.dart';
import 'package:gold_mine/widgets/home.dart';
import 'package:gold_mine/providers/material_provider.dart';
import 'package:provider/provider.dart';

void main() {
 runApp(MultiProvider(
     providers: [
       ChangeNotifierProvider(create: (_) => MaterialProvider()),
     ],
     child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gold Mine',
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff0f4c81)),
      ),
      initialRoute: LauncherPage.routeName,

      routes: {
        HomePage.routeName:(context)=>HomePage(),
        LauncherPage.routeName:(context)=>LauncherPage(),
      },

    );
  }
}

