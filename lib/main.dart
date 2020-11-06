import 'package:flutter/material.dart';
import 'home.dart';
import 'roomsPanel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      routes: {
        'homeLink': (context) => Home(),
        'RoomsPanel': (context) => RoomsPanel(),
      },
    );
  }
}
