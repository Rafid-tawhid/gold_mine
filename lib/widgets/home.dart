import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:flutter/material.dart';

import '../api_calls/api_calls.dart';
import '../pages/home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName='/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; //default index

  List<Widget> _widgetOptions = [
    GoldPage(),
    Text('Silver'),
    Text('Diamond'),

  ];

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomLineIndicatorBottomNavbar(
        selectedColor: Color(0xffda9100),
        unSelectedColor: Colors.orangeAccent,
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
            icon: Icons.compare_arrows,
          ),
          CustomBottomBarItems(
            label: 'Silver',
            icon: Icons.currency_bitcoin,
          ),
          CustomBottomBarItems(
              label: 'Diamond', icon: Icons.diamond_outlined),

        ],
      ),
    );
  }
}
