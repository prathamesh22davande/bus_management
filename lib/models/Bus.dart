class Bus {
  String busNumber;
  String driverName;
  String driverPhoneNumber;
  String cleanerName;
  String cleanerPhoneNumber;
  String routeFrom;
  String routeTo;
  String travelsName;

  Bus(
      {required this.busNumber,
      required this.driverName,
      required this.driverPhoneNumber,
      required this.cleanerName,
      required this.cleanerPhoneNumber,
      required this.routeFrom,
      required this.routeTo,
      required this.travelsName}) {}

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