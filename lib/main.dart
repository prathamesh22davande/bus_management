import 'package:bus_management/screens/BusDetail.screen.dart';
import 'package:bus_management/screens/Buses.screen.dart';
import 'package:bus_management/screens/Notification.screen.dart';
import 'package:bus_management/screens/Travels.screen.dart';
import 'package:flutter/material.dart';
import './screens/add_bus_information.screen.dart';

import './screens/home.screen.dart';
import './widgets/BottomNav.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _bottomNavIndex = 1;

  changeNavigation(idx) {
    print(idx);
    setState(() {
      _bottomNavIndex = idx;
    });
  }

  List<Widget> navWidgets = [
    NotificationScreen(),
    BusesScreen(),
    TravelsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      title: 'Demo App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo App'),
        ),
        bottomNavigationBar: BottomNav(
          currentIdx: _bottomNavIndex,
          changeNav: changeNavigation,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            navWidgets.elementAt(_bottomNavIndex),
          ],
        ),
        floatingActionButton: _bottomNavIndex != 0
            ? FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.add),
              )
            : null,
      ),
    );
  }
}
