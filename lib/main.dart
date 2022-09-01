
import 'package:bmi_calculator/modules/bmi_result.dart';
import 'package:flutter/material.dart';

import 'modules/bmi_valculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.black),

        primarySwatch: Colors.blue,
      ),
      home:BmiCalculator()
    );
  }
}


