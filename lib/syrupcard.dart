import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class SyrupCard extends StatefulWidget {
  final String medicationName;
  final String dosage;
  SyrupCard({required this.medicationName, required this.dosage});

  @override
  State<SyrupCard> createState() => _SyrupCardState();
}

class _SyrupCardState extends State<SyrupCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.medication_liquid_rounded,
                color: Colors.amber,
              ),
              title: Text(widget.medicationName),
              subtitle: Text('Dosage: ${widget.dosage}'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('I took my medicine'),
                  onPressed: () {/* ... */},
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
