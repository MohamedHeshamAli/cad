import 'package:cad/Widegets.dart';
import 'package:cad/cad_calculations.dart';
import 'package:cad/result_screen/details_screen.dart';
import 'package:cad/result_screen/result_screen.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  @override
  List<Map> Branches = [];
  List<double> Zb = [];
  List<double> Eb = [];
  List<double> Ib = [];
  var _BranchNameController = TextEditingController();
  var _StartNodeController = TextEditingController();
  var _EndNodeController = TextEditingController();
  var _VoltageSourceController = TextEditingController();
  var _CurrentSourceController = TextEditingController();
  var _ImpedanceController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Cad")),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 10),
              InputWidget(
                title: "Branch Name   ",
                controller: _BranchNameController,
                hint: "Enter Branch Name",
                validator: (val) {
                  if (val!.isEmpty)
                    return "Branch Name must not be empty";
                  else
                    return null;
                },
              ),
              SizedBox(height: 10),
              InputWidget(
                  validator: (val) {
                    try {
                      if (val!.isEmpty)
                        return "Start Node must not be empty";
                      else {
                        int.parse(val);
                        return null;
                      }
                    } catch (e) {
                      return "Start Node must be a number";
                    }
                  },
                  title: "Start Node        ",
                  controller: _StartNodeController,
                  hint: "Enter Start Node number"),
              SizedBox(height: 10),
              InputWidget(
                  validator: (val) {
                    try {
                      if (val!.isEmpty)
                        return "End Node must not be empty";
                      else {
                        int.parse(val);
                        return null;
                      }
                    } catch (e) {
                      return "End Node must be a number";
                    }
                  },
                  title: "End Node          ",
                  controller: _EndNodeController,
                  hint: "Enter End Node number "),
              SizedBox(height: 10),
              InputWidget(
                  validator: (val) {
                    try {
                      if (val!.isEmpty)
                        return "Impedance must not be empty";
                      else {
                        double.parse(val);
                        return null;
                      }
                    } catch (e) {
                      return "Impedance must be a number";
                    }
                  },
                  title: "Impedance       ",
                  controller: _ImpedanceController,
                  hint: "Enter Impedance value"),
              SizedBox(height: 10),
              InputWidget(
                validator: (val) {
                  try {
                    if (val!.isEmpty)
                      return "Voltage Source must not be empty";
                    else {
                      double.parse(val);
                      return null;
                    }
                  } catch (e) {
                    return "Voltage Source must be a number";
                  }
                },
                title: "Voltage Source",
                controller: _VoltageSourceController,
                hint: "Voltage Source value",
              ),
              SizedBox(height: 10),
              InputWidget(
                validator: (val) {
                  try {
                    if (val!.isEmpty)
                      return "Current Source must not be empty";
                    else {
                      double.parse(val);
                      return null;
                    }
                  } catch (e) {
                    return "Current Source must be a number";
                  }
                },
                title: "Current Source",
                controller: _CurrentSourceController,
                hint: "Current Source value",
              ),
              SizedBox(
                height: 170,
              ),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                        color: Colors.teal,
                        child: Text(
                          "Restart",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          Branches.clear();
                          Zb.clear();
                          Ib.clear();
                          Eb.clear();
                        }),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                      child: MaterialButton(
                          color: Colors.teal,
                          child: Text(
                            "Done",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () {
                            if (IsEmpetyValues() && Zb.isNotEmpty) {
                              Calculations result = Calculations(
                                  branches: Branches, Zb: Zb, Eb: Eb, Ib: Ib);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                          result: result,
                                        )),
                              );
                            } else {
                              if (formKey.currentState!.validate()) {
                                Ib.add(double.parse(
                                    _CurrentSourceController.text.toString()));
                                Eb.add(double.parse(
                                    _VoltageSourceController.text.toString()));
                                Zb.add(double.parse(
                                    _ImpedanceController.text.toString()));
                                Branches.add({
                                  "name": _BranchNameController.text.toString(),
                                  "start": int.parse(
                                      _StartNodeController.text.toString()),
                                  "end": int.parse(
                                      _EndNodeController.text.toString()),
                                });
                                ClearControllers();
                                try {
                                  Calculations result = Calculations(
                                      branches: Branches,
                                      Zb: Zb,
                                      Eb: Eb,
                                      Ib: Ib);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailsScreen(
                                              result: result,
                                            )),
                                  );
                                } catch (e) {}
                              }
                            }
                          })),
                  SizedBox(width: 5),
                  Expanded(
                    child: MaterialButton(
                        color: Colors.teal,
                        child: Text(
                          "add",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Ib.add(double.parse(
                                _CurrentSourceController.text.toString()));
                            Eb.add(double.parse(
                                _VoltageSourceController.text.toString()));
                            Zb.add(double.parse(
                                _ImpedanceController.text.toString()));
                            Branches.add({
                              "name": _BranchNameController.text.toString(),
                              "start": int.parse(
                                  _StartNodeController.text.toString()),
                              "end":
                                  int.parse(_EndNodeController.text.toString()),
                            });
                            ClearControllers();
                          }
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void ClearControllers() {
    _CurrentSourceController.clear();
    _VoltageSourceController.clear();
    _ImpedanceController.clear();
    _StartNodeController.clear();
    _EndNodeController.clear();
    _BranchNameController.clear();
  }

  bool IsEmpetyValues() {
    return _CurrentSourceController.text.isEmpty &&
        _VoltageSourceController.text.isEmpty &&
        _ImpedanceController.text.isEmpty &&
        _StartNodeController.text.isEmpty &&
        _EndNodeController.text.isEmpty &&
        _BranchNameController.text.isEmpty;
  }
}
