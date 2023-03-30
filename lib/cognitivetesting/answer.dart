import 'package:flutter/material.dart';
import 'package:gsoc/cognitivetesting/home.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final MaterialColor answerColor;
  final VoidCallback answerTap;
  Answer({required this.answerText, required this.answerColor,required this.answerTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: answerTap,
      child: Container(
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: answerColor,
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          answerText,
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }
}