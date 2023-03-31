import 'package:flutter/material.dart';
import 'package:phone_otpcheck/deets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class forgot extends StatefulWidget {
  @override
  State <forgot> createState() => _forgotState();
}

class _forgotState extends State<forgot> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _name;
  late String _phoneNumber;
  bool _detailsVerified = false;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      var url = 'http://10.0.2.2:8000/user/forgot_password';
      Map data = {
        'name': _name,
        'phone': _phoneNumber,

      };
      print(data);
      var body = json.encode(data);
      final body1 = json.decode(body);
      print(body1);
      var response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: body,
      );
      if (response.statusCode == 200) {
        // Data was successfully sent to the server
        setState(() {
          _detailsVerified = true;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data saved successfully')),
        );
      } else {
        // There was an error sending the data
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving data')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),

              TextFormField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (value?.length != 10) {
                    return 'Please enter a valid 10-digit phone number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phoneNumber = value!;
                },
              ),

              SizedBox(
                height: 22,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                     _submitForm();
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
                      'Enter',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}