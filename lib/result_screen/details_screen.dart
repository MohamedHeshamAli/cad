import 'package:cad/cad_calculations.dart';
import 'package:cad/result_screen/Tie_set_screen.dart';
import 'package:cad/result_screen/cut_set_screen.dart';
import 'package:cad/result_screen/result_screen.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Calculations result;
  DetailsScreen({required this.result});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Details"),
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultScreen(
                          result: result,
                        )),
              );
            },
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.teal, borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(15),
              child: Center(
                  child: Text(
                "Voltage & Current values",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TieSetScreen(
                          result: result,
                        )),
              );
            },
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.teal, borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(15),
              child: Center(
                  child: Text(
                "Tie Set Matrix",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CutSetScreen(
                          result: result,
                        )),
              );
            },
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.teal, borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(15),
              child: Center(
                  child: Text(
                "Cut Set Matrix",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
