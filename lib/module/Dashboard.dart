import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spendwise_app/data/appColors.dart';
import 'package:spendwise_app/module/Dashboard/Analysis/analysisPage.dart';
import 'package:spendwise_app/module/Dashboard/Home/homePage.dart';
import 'package:spendwise_app/module/Dashboard/Menu/menuPage.dart';
import 'package:spendwise_app/module/Dashboard/Transaction/transactionPage.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  late List<Widget> _pages;
  late List<BottomNavigationBarItem> items;

  @override
  void initState() {
    super.initState();

    _pages = <Widget>[
      const HomeScreen(),
      const TransactionScreen(),
      const AnalysisScreen(),
      const MenuScreen(),
    ];

    items = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const BottomNavigationBarItem(icon: Icon(CupertinoIcons.list_dash), label: 'Transactions'),
      const BottomNavigationBarItem(icon: Icon(Icons.analytics_outlined), label: 'Analysis'),
      const BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined), label: 'Menu'),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  showExitApp(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('Are you sure you want to exit the app?'),
          actions: <Widget>[
            TextButton(child: const Text('Cancel'), onPressed: () => Navigator.pop(context)),
            TextButton(child: const Text('Yes'), onPressed: () => SystemNavigator.pop()),
          ],
        );
      },
    );
  }

  Future<bool> onWillPop() {
    showExitApp(context);
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: onWillPop,
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedLabelStyle: TextStyle(color: appColors.primaryColor, fontSize: 12),
        unselectedLabelStyle: TextStyle(color: appColors.greyColor, fontSize: 10),
        selectedItemColor: appColors.primaryColor,
        unselectedItemColor: appColors.greyColor,
        selectedIconTheme: const IconThemeData(size: 35),
        unselectedIconTheme: const IconThemeData(size: 30),
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: items,
      ),
    );
  }
}
