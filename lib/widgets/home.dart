import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:flutter/material.dart';

import '../api_calls/api_calls.dart';
import '../pages/dollar_page.dart';
import '../pages/gold_page.dart';
import '../pages/intro_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName='/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; //default index

  final List<Widget> _widgetOptions = [
    const GoldPage(),
    const DollarPage(),
    AbsoluteZeroProfileScreen(),

  ];

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  return WillPopScope(
    onWillPop: () async {
      bool exitConfirmed = await _showExitDialog(context);
      return exitConfirmed ?? false;
    },
    child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: CustomLineIndicatorBottomNavbar(
          selectedColor: const Color(0xff0f4c81),
          unSelectedColor: const Color(0xff2a6aa8),
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          unselectedIconSize: 15,
          selectedIconSize: 20,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          enableLineIndicator: true,
          lineIndicatorWidth: 3,
          indicatorType: IndicatorType.Top,
          // gradient: LinearGradient(
          //   colors: [Colors.pink, Colors.yellow],
          // ),
          customBottomBarItems: [
            CustomBottomBarItems(
              label: 'Gold',
              icon: Icons.diamond_rounded,
            ),
            CustomBottomBarItems(
              label: 'Doller',
              icon: Icons.attach_money,
            ),
            CustomBottomBarItems(
                label: 'Info', icon: Icons.web_outlined),

          ],
        ),
      ),
  );
  }

  _showExitDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Exit App"),
        content: Text("Are you sure you want to exit?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text("Cancel", style: TextStyle(color: Colors.blue)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text("Exit", style: TextStyle(color: Colors.white)),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
