import 'package:cloud_firestore/cloud_firestore.dart';

class Bus {
  late String busNumber;
  late String driverName;
  late String driverPhoneNumber;
  late String cleanerName;
  late String cleanerPhoneNumber;
  late String routeFrom;
  late String routeTo;
  late String travelsName;

  Bus(
      {required this.busNumber,
      required this.driverName,
      required this.driverPhoneNumber,
      required this.cleanerName,
      required this.cleanerPhoneNumber,
      required this.routeFrom,
      required this.routeTo,
      required this.travelsName}) {}

  Bus.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    busNumber = documentSnapshot['busNumber'];
    driverName = documentSnapshot['driverName'];
    driverPhoneNumber = documentSnapshot['driverPhoneNumber'];
    cleanerName = documentSnapshot['cleanerName'];
    cleanerPhoneNumber = documentSnapshot['cleanerPhoneNumber'];
    routeFrom = documentSnapshot['routeFrom'];
    routeTo = documentSnapshot['routeTo'];
    travelsName = documentSnapshot['travelsName'];
  }

  Map<String, dynamic> toMap() {
    return {
      "busNumber": this.busNumber,
      "driverName": this.driverName,
      "driverPhoneNumber": this.driverPhoneNumber,
      "cleanerName": this.cleanerName,
      "cleanerPhoneNumber": this.cleanerPhoneNumber,
      "routeFrom": this.routeFrom,
      "routeTo": this.routeTo,
      "travelsName": this.travelsName
    };
  }
}
