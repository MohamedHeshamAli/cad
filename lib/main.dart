import 'package:cad/cad_calculations.dart';
import 'package:cad/result_screen/Tie_set_screen.dart';
import 'package:cad/result_screen/cut_set_screen.dart';
import 'package:cad/result_screen/details_screen.dart';
import 'package:cad/result_screen/result_screen.dart';
import 'package:flutter/material.dart';

import 'input_screen/input_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.black54,
      ),
      home: InputScreen(),
    );
  }
}
//     DetailsScreen(
//   result: Calculations(branches: [
//     {"start": 1, "end": 3, "name": "b"},
//     {"start": 1, "end": 2, "name": "c"},
//     {"start": 3, "end": 1, "name": "a"},
//     {"start": 2, "end": 3, "name": "d"}
//   ], Zb: [
//     5,
//     10,
//     5,
//     5
//   ], Eb: [
//     0,
//     0,
//     10,
//     0
//   ], Ib: [
//     0,
//     0,
//     0,
//     0
//   ]),
// )
