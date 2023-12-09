// ignore: file_names
// ignore: file_names
// ignore_for_file: file_names

import 'package:cad/cad_calculations.dart';
import 'package:flutter/material.dart';

class CutSetScreen extends StatelessWidget {
  final Calculations result;
  CutSetScreen({required this.result});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Cut Set"),
        ),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, n) {
            return RowWidget(n);
          },
          itemCount: result.getCutSetMat().length),
    );
  }

  Widget RowWidget(int n) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 40,
      decoration: BoxDecoration(
          color: Colors.teal, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var item in result.getCutSetMat()[n])
                Text(
                  "${item.toInt() == item ? "${item.toInt()} " : item.toStringAsFixed(3)}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
            ],
          )
        ],
      ),
    );
  }
}
