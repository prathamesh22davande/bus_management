import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddBusInformation extends StatefulWidget {
  const AddBusInformation({super.key});

  @override
  State<AddBusInformation> createState() => _AddBusInformationState();
}

class _AddBusInformationState extends State<AddBusInformation> {
  static const String OTHER = 'Other';
  late String _busNumber;
  late String _driverName;
  late String _driverNumber;
  late String _cleanerName;
  late String _cleanerNumber;
  late String _routeFrom;
  late String _routeTo;
  var _otherTravelAgencyName = null;

  List<String> travellers = ['Ashoka', 'Konduskar', 'Balaji', OTHER];
  late String _selectedTraveller = travellers[0];

  final GlobalKey<FormState> addBusInfoKey = GlobalKey<FormState>();

  bool showOtherInputField = false;

  Widget _buildBusNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Bus Number'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }
      },
      keyboardType: TextInputType.text,
      onSaved: (String? value) {
        _busNumber = value.toString();
      },
    );
  }

  Widget _buildDriverName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Driver Name'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return ' Driver Name is Required';
        }
      },
      keyboardType: TextInputType.name,
      onSaved: (String? value) {
        _driverName = value.toString();
      },
    );
  }

  Widget _buildDriverNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Driver Phone Number'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Driver Phone Number is Required';
        }
        if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(value)) {
          return 'Please enter valid phone number';
        }
      },
      keyboardType: TextInputType.phone,
      onSaved: (String? value) {
        _driverNumber = value.toString();
      },
    );
  }

  Widget _buildCleanerName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Cleaner Name'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return ' Cleaner Name is Required';
        }
      },
      keyboardType: TextInputType.name,
      onSaved: (String? value) {
        _cleanerName = value.toString();
      },
    );
  }

  Widget _buildCleanerNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Cleaner Phone Number'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Cleaner Phone Number is Required';
        }
        if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(value)) {
          return 'Please enter valid phone number';
        }
      },
      keyboardType: TextInputType.phone,
      onSaved: (String? value) {
        _cleanerNumber = value.toString();
      },
    );
  }

  Widget _buildRouteFrom() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Route From'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Route From is Required';
        }
      },
      keyboardType: TextInputType.text,
      onSaved: (String? value) {
        _routeFrom = value.toString();
      },
    );
  }

  Widget _buildRouteTo() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Route To'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Route To is Required';
        }
      },
      keyboardType: TextInputType.text,
      onSaved: (String? value) {
        _routeTo = value.toString();
      },
    );
  }

  Widget _buildOtherTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Travel Agency Name'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Please enter travel agency name';
        }
      },
      keyboardType: TextInputType.text,
      onSaved: (String? value) {
        _otherTravelAgencyName = value.toString();
        setState(() {
          travellers.add(value.toString());
        });
      },
    );
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    return travellers.map((traveller) {
      return DropdownMenuItem(
        child: Text(traveller),
        value: traveller,
      );
    }).toList();
  }

  Widget _buildTraveller() {
    return DropdownButton(
        value: _selectedTraveller,
        items: getDropDownMenuItems(),
        isExpanded: true,
        onChanged: (String? value) {
          if (value == OTHER) {
            showOtherInputField = true;
          } else {
            showOtherInputField = false;
          }
          setState(() {
            _selectedTraveller = value.toString();
          });
        });
  }

  _addBusInformation() {
    if (!addBusInfoKey.currentState!.validate()) {
      return;
    }
    addBusInfoKey.currentState!.save();

    print(_busNumber);
    print(_driverName);
    print(_driverNumber);
    print(_cleanerName);
    print(_routeFrom);
    print(_routeTo);
    print(_selectedTraveller);

    if (_otherTravelAgencyName != null) {
      print(_otherTravelAgencyName);
    }

    final newBus = new Bus(
        busNumber: _busNumber,
        driverName: _driverName,
        driverPhoneNumber: _driverNumber,
        cleanerName: _cleanerName,
        cleanerPhoneNumber: _cleanerNumber,
        travelsName: _selectedTraveller,
        routeFrom: _routeFrom,
        routeTo: _routeTo);

    createBus(newBus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: addBusInfoKey,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildBusNumber(),
                    _buildDriverName(),
                    _buildDriverNumber(),
                    _buildCleanerName(),
                    _buildCleanerNumber(),
                    _buildRouteFrom(),
                    _buildRouteTo(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildTraveller(),
                    if (showOtherInputField) _buildOtherTextField(),
                    SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                        onPressed: _addBusInformation, child: Text('Add Bus'))
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Future createBus(Bus newBus) {
    final busDocument = FirebaseFirestore.instance.collection('Bus');
    return busDocument
        .add(newBus.toMap())
        .then((value) => showToastMessage("New Bus Added Successfully"))
        .catchError((error) => showToastMessage("Bus Add Failed"));
  }

  void showToastMessage(String message) {
    Fluttertoast.showToast(
        backgroundColor: Colors.green,
        msg: message, //message to show toast
        toastLength: Toast.LENGTH_LONG, //duration for message to show
        gravity: ToastGravity.BOTTOM, //where you want to show, top, bottom
        timeInSecForIosWeb: 1, //for iOS only
        //backgroundColor: Colors.red, //background Color for message
        textColor: Colors.white, //message text color
        fontSize: 16.0 //message font size
        );
  }
}

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
