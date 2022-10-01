import 'package:bus_management/screens/BusDetail.screen.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class BusesScreen extends StatelessWidget {
  BusesScreen({super.key});

  final items = [
    {
      'busId': 1,
      'busNo': 'MH092222',
      'driverName': 'ABC',
      'driverPhone': '9999999999',
      'cleanerName': 'PQR',
      'cleanerPhone': '9999999999',
      'routeFrom': 'Ichalkaranji',
      'routeTo': 'Banglore'
    },
    {
      'busId': 2,
      'busNo': 'MH092111',
      'driverName': 'MNO',
      'driverPhone': '9999999999',
      'cleanerName': 'MMM',
      'cleanerPhone': '9999999999',
      'routeFrom': 'Ichalkaranji',
      'routeTo': 'Banglore'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => BusDetailsScreen(
                          busInfo: items.elementAt(index),
                        ))));
          },
          child: Card(
            color: Color(0xfff1f4ff),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        items[index]['busNo'].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                    Text(
                      items[index]['routeFrom'].toString() +
                          ' - ' +
                          items[index]['routeTo'].toString(),
                      style: TextStyle(color: Color(0xff818488)),
                    )
                  ]),
            ),
          ),
        );
      },
    ));
  }
}
