import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import './screens/add_bus_information.screen.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Demo App',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Demo App'),
          ),
          body: AddBusInformation(),
        ));
  }
}
