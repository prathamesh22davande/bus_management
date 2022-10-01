import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utility/Utlity.dart';
import '../models/Bus.dart';

class AddBusInformation extends StatefulWidget {
  const AddBusInformation({super.key});

  @override
  State<AddBusInformation> createState() => _AddBusInformationState();
}

class _AddBusInformationState extends State<AddBusInformation> {
  static const String OTHER = 'Other';

  Map<String, String> busInformation = Map();
  var _otherTravelAgencyName = null;

  List<String> travellers = ['Ashoka', 'Konduskar', 'Balaji', OTHER];
  late String _selectedTraveller = travellers[0];

  final GlobalKey<FormState> addBusInfoKey = GlobalKey<FormState>();

  bool showOtherInputField = false;

  Widget _buildTextField(
      {required String labelText,
      required String labelVar,
      required Map<String, String> busInfo,
      bool isPhoneValidationRequired = false}) {
    return TextFormField(
      decoration: InputDecoration(labelText: labelText),
      validator: (String? value) {
        if (value!.isEmpty) {
          return labelText + ' is Required';
        }
        if (isPhoneValidationRequired &&
            !RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(value)) {
          return 'Please enter valid phone number';
        }
      },
      keyboardType:
          isPhoneValidationRequired ? TextInputType.phone : TextInputType.text,
      onSaved: (String? value) {
        busInfo[labelVar] = value.toString();
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

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    return travellers.map((traveller) {
      return DropdownMenuItem(
        child: Text(traveller),
        value: traveller,
      );
    }).toList();
  }

  _addBusInformation() {
    if (!addBusInfoKey.currentState!.validate()) {
      return;
    }
    addBusInfoKey.currentState!.save();

    final newBus = new Bus(
        busNumber: busInformation['busNumber'].toString(),
        driverName: busInformation['driverName'].toString(),
        driverPhoneNumber: busInformation['driverNumber'].toString(),
        cleanerName: busInformation['cleanerName'].toString(),
        cleanerPhoneNumber: busInformation['cleanerNumber'].toString(),
        travelsName: _selectedTraveller,
        routeFrom: busInformation['routeFrom'].toString(),
        routeTo: busInformation['routeTo'].toString());

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
                    _buildTextField(
                        labelText: 'Bus Number',
                        labelVar: 'busNumber',
                        busInfo: busInformation),
                    _buildTextField(
                        labelText: 'Driver Name',
                        labelVar: 'driverName',
                        busInfo: busInformation),
                    _buildTextField(
                        labelText: 'Driver Number',
                        labelVar: 'driverNumber',
                        busInfo: busInformation,
                        isPhoneValidationRequired: true),
                    _buildTextField(
                        labelText: 'Cleaner Name',
                        labelVar: 'cleanerName',
                        busInfo: busInformation),
                    _buildTextField(
                        labelText: 'Cleaner Number',
                        labelVar: 'cleanerNumber',
                        busInfo: busInformation,
                        isPhoneValidationRequired: true),
                    _buildTextField(
                        labelText: 'Route From',
                        labelVar: 'routeFrom',
                        busInfo: busInformation),
                    _buildTextField(
                        labelText: 'Route To',
                        labelVar: 'routeTo',
                        busInfo: busInformation),
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
        .then((value) => Utility.showToastMessage("New Bus Added Successfully"))
        .catchError((error) => Utility.showToastMessage("Bus Add Failed"));
  }
}
