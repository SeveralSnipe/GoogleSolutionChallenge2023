import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class MedCard extends StatefulWidget {
  final String medicationName;
  final String dosage;
  final bool syrup;
  MedCard({required this.medicationName, required this.dosage, required this.syrup});

  @override
  State<MedCard> createState() => _MedCardState();
}

class _MedCardState extends State<MedCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(
                (widget.syrup)?Icons.medication_liquid_rounded:Icons.medication_rounded,
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
