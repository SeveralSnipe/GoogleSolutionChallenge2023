import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

import './medcard.dart';
import './syrupcard.dart';

class MedList extends StatelessWidget {
  const MedList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MedCard(medicationName: 'Paracetamol', dosage: '200 mg'),
        SyrupCard(medicationName: 'Gaviscon', dosage: '100 ml'),
      ],
    );
  }
}
