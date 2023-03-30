import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './medlist.dart';
import 'package:gsoc/EmergencyList/models/emergencymain.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elderly Helper',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.highContrastLight(
            primary: Colors.grey),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = MedList();
        break;
      case 1:
        page = Emergency();
        break;
      case 2:
        page = const Placeholder(color: Colors.blue);
        break;
      default:
        throw UnimplementedError("No widget for $selectedIndex");
    }
    return Scaffold(
      bottomNavigationBar: SafeArea(
          child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.medication), label: 'Medication'),
          BottomNavigationBarItem(
              icon: Icon(Icons.phone), label: 'Contact Manager'),
          BottomNavigationBarItem(
              icon: Icon(Icons.health_and_safety_rounded),
              label: 'Breathing Exercise'),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      )),
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: page,
      ),
    );
  }
}
