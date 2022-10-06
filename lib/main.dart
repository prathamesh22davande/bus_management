import 'package:bus_management/screens/BusDetail.screen.dart';
import 'package:bus_management/screens/Buses.screen.dart';
import 'package:bus_management/screens/Notification.screen.dart';
import 'package:bus_management/screens/Travels.screen.dart';
import 'package:bus_management/screens/add_bus_information.screen.dart';
// import 'package:cloud_firestore_web/cloud_firestore_web.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import './screens/home.screen.dart';
import './widgets/BottomNav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        body: navWidgets.elementAt(_bottomNavIndex),
        floatingActionButton: _bottomNavIndex != 0
            ? Builder(builder: (context) {
                return FloatingActionButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => AddBusInformation()))),
                  child: Icon(Icons.add),
                );
              })
            : null,
      ),
    );
  }
}
