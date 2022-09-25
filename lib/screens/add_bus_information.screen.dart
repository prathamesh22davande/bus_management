import 'package:flutter/material.dart';

class AddBusInformation extends StatefulWidget {
  const AddBusInformation({super.key});

  @override
  State<AddBusInformation> createState() => _AddBusInformationState();
}

class _AddBusInformationState extends State<AddBusInformation> {
  late String _busNumber;
  late String _driverName;
  late String _driverNumber;
  late String _cleanerName;
  late String _cleanerNumber;
  late String _routeFrom;
  late String _routeTo;

  List<String> travellers = ['Ashoka', 'Konduskar', 'Balaji'];
  late String _selectedTraveller = travellers[0];

  final GlobalKey<FormState> addBusInfoKey = GlobalKey<FormState>();

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
}
