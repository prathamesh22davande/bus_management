import 'package:flutter/material.dart';

class BusDetailsScreen extends StatelessWidget {
  Map busInfo;
  BusDetailsScreen({required this.busInfo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bus Details' + busInfo['busNo']),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                busInfo['busNo'],
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(color: Colors.black),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    color: Color(0xffb0e2b6),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                width: double.infinity,
                padding: EdgeInsets.all(10.0),
                child: Column(children: [
                  Row(
                    children: [
                      Icon(Icons.drive_eta_sharp, size: 18),
                      Text(
                        'Driver : ',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        busInfo['driverName'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.phone),
                      Text(
                        'Phone : ',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        busInfo['driverPhone'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ]),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    color: Color(0xffb0e2b6),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                width: double.infinity,
                padding: EdgeInsets.all(10.0),
                child: Column(children: [
                  Row(
                    children: [
                      Icon(Icons.cleaning_services),
                      Text(
                        'Cleaner : ',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        busInfo['cleanerName'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.phone),
                      Text(
                        'Phone : ',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        busInfo['cleanerPhone'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ]),
              ),
              Text(busInfo['routeFrom'] + ' - ' + busInfo['routeTo']),
            ],
          ),
        ),
      ),
    );
  }
}
