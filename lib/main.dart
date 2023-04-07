import 'package:flutter/material.dart';
import 'package:gold_mine/home.dart';
import 'package:gold_mine/material_provider.dart';
import 'package:provider/provider.dart';

void main() {
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MaterialProvider()),
    ],
    child: MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gold Mine',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffe5b73b)),
      ),
      initialRoute: HomePage.routeName,

      routes: {
        HomePage.routeName:(context)=>HomePage()
      },

    );
  }
}

