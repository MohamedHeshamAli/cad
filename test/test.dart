import 'package:scidart/numdart.dart';
import 'package:scidart/src/numdart/numdart.dart';

import '../lib/cad_calculations.dart';

void main() {
  Calculations c = Calculations(branches: [
    {"start": 1, "end": 3, "name": "b"},
    {"start": 1, "end": 2, "name": "c"},
    {"start": 3, "end": 1, "name": "a"},
    {"start": 2, "end": 3, "name": "d"}
  ], Zb: [
    5,
    10,
    5,
    5
  ], Eb: [
    0,
    0,
    10,
    0
  ], Ib: [
    0,
    0,
    0,
    0
  ]);
  print(c.getCutSetMat());
  // print(c.getTieSetMat());
  // print(c.getCutSetMat());
  // var a = Array2d([
  //   Array([1.0, 2.0, 3.0]),
  //   Array([4.0, 5.55, 6.0]),
  //   Array([7.0, 8.0, 10.0]),
  // ]);
  // print(matrixInverse(a));
  // print(array2dMultiplyToScalar(a, 2));
  // print(matrixTranspose(a));
  // print(matrixDot(a, a));
  // print(matrixInverse(a));
  // print(matrixDeterminant(a));
  // var A = Array2d([
  //   Array([10, -5]),
  //   Array([-5, 20]),
  // ]);
  // var b = Array2d([
  //   Array([10]),
  //   Array([0]),
  // ]);

  //print(matrixSolve(A, b));
  //a = matrixTranspose(a);
  // a = matrixTranspose(a);
  // var c = a.toList();
  // c.addAll(matrixIdentity(3, 3).toList());
  // a = Array2d(c);
  // a = matrixTranspose(a);
}
