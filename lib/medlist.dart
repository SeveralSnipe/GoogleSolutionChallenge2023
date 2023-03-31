import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

import './medcard.dart';

List<Widget> medWidgets = [];

class MedList extends StatefulWidget {
  MedList({super.key});

  @override
  State<MedList> createState() => _MedListState();
}

class _MedListState extends State<MedList> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () async {
              final value = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddPage()),
              );
              setState(() {});
            },
            child: const Text(
              'Add Medicine',
              style: TextStyle(color: Colors.amber),
            ),
          ),
        ),
        const SizedBox(
          height: 80,
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: medWidgets.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: medWidgets[index],
              );
            }))
      ],
    );
  }
}

class AddPage extends StatelessWidget {
  AddPage({super.key});

  final TextEditingController _typeController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _dosageController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: _typeController,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter \'s\' for syrup and \'p\'for pills'),
                    validator: (value) {
                      if (value!.isEmpty || !(value == 's' || value == 'p')) {
                        return 'Please enter a valid input';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: _nameController,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter medicine name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a valid input';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: _dosageController,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter dosage'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a valid input';
                      }
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (_typeController.text == 's') {
                              medWidgets.add(MedCard(
                                  medicationName: _nameController.text,
                                  dosage: _dosageController.text,
                                  syrup: true));
                            } else {
                              medWidgets.add(MedCard(
                                  medicationName: _nameController.text,
                                  dosage: _dosageController.text,
                                  syrup: false));
                            }
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Submit')))
              ],
            )));
  }
}