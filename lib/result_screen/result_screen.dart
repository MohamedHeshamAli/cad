import 'package:cad/cad_calculations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final Calculations result;
  ResultScreen({required this.result});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Results"),
        ),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, n) {
            return Container(
              margin: EdgeInsets.all(10),
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.teal, borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    " Current in Branch ${result.branches[n]["name"].toString().toUpperCase()} : ${result.Jb[n].toStringAsFixed(3)}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " Voltage in Branch ${result.branches[n]["name"].toString().toUpperCase()} : ${result.Vb[n].toStringAsFixed(3)}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            );
          },
          itemCount: result.branches.length),
    );
  }
}
