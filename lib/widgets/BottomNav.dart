import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final currentIdx;
  Function changeNav;
  BottomNav({required this.currentIdx, required this.changeNav});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIdx,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications), label: 'Notifications'),
        BottomNavigationBarItem(
            icon: Icon(Icons.bus_alert_rounded), label: 'Buses'),
        BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Travels'),
      ],
      onTap: ((value) {
        // print(value);rr
        changeNav(value);
      }),
    );
  }
}
