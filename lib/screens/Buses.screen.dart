import 'package:bus_management/models/Bus.dart';
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
                    onTap: () => showDetailsClick(documentSnapshot),
                    child: Card(
                      color: Color(0xfff1f4ff),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      // items[index]['busNo'].toString(),
                                      streamSnapshot
                                          .data!.docs[index]['busNumber']
                                          .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          fontFamily: 'Poppins'),
                                    ),
                                  ),
                                  Text(
                                    "Driver Name : " +
                                        streamSnapshot.data!.docs[index]
                                            ['driverName'],
                                    style: TextStyle(color: Color(0xff818488)),
                                  ),
                                  Text(
                                    "Driver Name : " +
                                        streamSnapshot.data!.docs[index]
                                            ['driverPhoneNumber'],
                                    style: TextStyle(color: Color(0xff818488)),
                                  ),
                                  Text(
                                    streamSnapshot.data!.docs[index]
                                            ['routeFrom'] +
                                        ' - ' +
                                        streamSnapshot.data!.docs[index]
                                            ['routeTo'],
                                    style: TextStyle(color: Color(0xff818488)),
                                  )
                                ]),
                            Container(
                              padding: EdgeInsets.all(5),
                              color: Colors.black54,
                              child: Text(
                                '10',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
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

  showDetailsClick(documentSnapshot) {
    Map busInfo = Map();

    busInfo['busNumber'] = documentSnapshot['busNumber'];
    busInfo['driverName'] = documentSnapshot['driverName'];
    busInfo['driverPhoneNumber'] = documentSnapshot['driverPhoneNumber'];
    busInfo['cleanerName'] = documentSnapshot['cleanerName'];
    busInfo['cleanerPhoneNumber'] = documentSnapshot['cleanerPhoneNumber'];
    busInfo['routeFrom'] = documentSnapshot['routeFrom'];
    busInfo['routeTo'] = documentSnapshot['routeTo'];
    busInfo['travelsName'] = documentSnapshot['travelsName'];

    Bus bus = Bus.fromDocumentSnapshot(documentSnapshot: documentSnapshot);
    Navigator.push(context,
        MaterialPageRoute(builder: ((context) => BusDetailsScreen(bus: bus))));
  }
}
