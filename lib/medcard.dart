import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class MedCard extends StatefulWidget {
  final String medicationName;
  final String dosage;
  final bool syrup;
  MedCard(
      {required this.medicationName,
        required this.dosage,
        required this.syrup});

  @override
  State<MedCard> createState() => _MedCardState();
}

class _MedCardState extends State<MedCard> {
  bool _hasBeenPressed = false;
  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text(
              'Are you sure that you want to delete this medicine from the list?'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                  backgroundColor: Colors.green),
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                  backgroundColor: Colors.red),
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                CloseButton(
                  color: Colors.red,
                  onPressed: () {
                    _dialogBuilder(context);
                  },
                )
              ],
            ),
            ListTile(
              leading: Icon(
                (widget.syrup)
                    ? Icons.medication_liquid_rounded
                    : Icons.medication_rounded,
                color: Colors.amber,
              ),
              title: Text(widget.medicationName),
              subtitle: Text('Dosage: ${widget.dosage}'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {setState(() {
                    _hasBeenPressed=!_hasBeenPressed;
                  });},
                  style: ButtonStyle(backgroundColor: _hasBeenPressed?MaterialStatePropertyAll(Colors.red):MaterialStatePropertyAll(Colors.blue)),


                  child: const Text(
                    'I have taken my medicine',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}