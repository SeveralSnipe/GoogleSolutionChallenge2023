import 'package:flutter/material.dart';
import 'package:phone_otpcheck/homepage.dart';
import 'package:phone_otpcheck/forgot.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class deets extends StatefulWidget {
  @override
  State <deets> createState() => _deetsState();
}

class _deetsState extends State<deets> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _phoneNumber;
  late String _password;
  // bool _detailsVerified = false;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      var url = 'http://10.0.2.2:8000/user/login';
      Map data = {
        'phone': _phoneNumber,
        'password': _password,

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

        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data saved successfully')),
        );
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      }
      else if (response.statusCode == 400) {
        setState(() {

        });
        // There was an error sending the data
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Incorrect Phone Number or Password ')),

        );
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => deets()),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
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

              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Password';
                  }

                  return null;
                },
                onSaved: (value) {
                  _password = value!;
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
                height: 100,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => forgot()),
                    );
                  },
                  style: ButtonStyle(
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.black),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
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
                      'Forgot Password?',
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