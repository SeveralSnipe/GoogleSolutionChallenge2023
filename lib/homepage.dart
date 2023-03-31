import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:phone_otpcheck/phone.dart';
import 'package:phone_otpcheck/medlist.dart';
import 'package:provider/provider.dart';
import 'package:phone_otpcheck/breathing.dart';


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
        page = BreathingExercisePage();
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