import 'package:flutter/material.dart';
import 'package:phone_otpcheck/deets.dart';


class Register extends StatefulWidget {
  @override
  State <Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Thank You For Registering'),
        ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
    child: Form(
    child: Column(
    children: [

    SizedBox(
    height: 22,
    ),

    SizedBox(
    width: double.infinity,
    child: ElevatedButton(
    onPressed: () {
    Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => deets()),
    );
    },
    style: ButtonStyle(
    foregroundColor:
    MaterialStateProperty.all<Color>(Colors.black),
    backgroundColor:
    MaterialStateProperty.all<Color>(Colors.yellowAccent),
    shape:
    MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(24.0),
    ),
    ),
    ),
    child: Padding(
    padding: EdgeInsets.all(14.0),
    child: Text(
    'Login',
    style: TextStyle(fontSize: 24),
    ),
    ),
    ),
    ),
    ],
    ),
    ),
        ),
    );
  }
}