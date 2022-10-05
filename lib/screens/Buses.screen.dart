import 'package:bus_management/screens/BusDetail.screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class BusesScreen extends StatefulWidget {
  BusesScreen({super.key});

  @override
  State<BusesScreen> createState() => _BusesScreenState();
}

class _BusesScreenState extends State<BusesScreen> {
  final CollectionReference _buses =
      FirebaseFirestore.instance.collection("Bus");

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
    return StreamBuilder(
      stream: _buses.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (streamSnapshot.hasData) {
          print(streamSnapshot.data);
          return Container(
            width: double.infinity,
            height: double.infinity,
            child: ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Container(
                  child: GestureDetector(
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
                                  // items[index]['busNo'].toString(),
                                  streamSnapshot.data!.docs[index]['busNumber']
                                      .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontFamily: 'Poppins'),
                                ),
                              ),
                              Text(
                                streamSnapshot.data!.docs[index]['routeFrom'] +
                                    ' - ' +
                                    streamSnapshot.data!.docs[index]['routeTo'],
                                style: TextStyle(color: Color(0xff818488)),
                              )
                            ]),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
