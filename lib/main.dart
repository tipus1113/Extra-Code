import 'package:flutter/material.dart';
import 'package:simple_interest_calculator/Util/utils.dart';
import 'package:simple_interest_calculator/screens/calculator_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Simple Interest Calculator',
    home: SIForm(),
    theme: ThemeData(
        primaryColor: Colors.orange, accentColor: Colors.orangeAccent),
  ));
}

