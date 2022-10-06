import 'package:bus_management/models/Bus.dart';
import 'package:flutter/material.dart';

class BusDetailsScreen extends StatelessWidget {
  Bus bus;
  BusDetailsScreen({required this.bus});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bus Details' + bus.busNumber),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bus.busNumber,
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
                        bus.driverName,
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
                        bus.driverPhoneNumber,
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
                        bus.cleanerName,
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
                        bus.cleanerPhoneNumber,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ]),
              ),
              Text(bus.routeFrom + ' - ' + bus.routeTo),
            ],
          ),
        ),
      ),
    );
  }
}
