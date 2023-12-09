import 'package:cad/cad_calculations.dart';
import 'package:ml_linalg/linalg.dart';
import 'package:linalg/linalg.dart' as linalg;

void main() {
  var A_T = linalg.Matrix.fill(5, 1);
  A_T[0][0] = 5;
  print(A_T);
  var m1 = Matrix.fromList([
    [1.0, 2.0, 3.0, 4.0],
    [5.0, 6.0, 7.0, 8.0],
    [9.0, .0, -2.0, -3.0],
    [9.0, .0, -2.0, -3.0],
  ]);
  var col = Matrix.column([1, 2, 3, 4]);

  var B = linalg.Matrix([
    [1.0, 2.0, 3.0],
    [4.0, 5.55, 6.0],
    [7.0, 8.0, 10.0],
  ]);
  print(B * B);
  List l = B.toList();
  var l2 = (Matrix.identity(3).toList()).cast<List<double>>();
  l.addAll(l2);
  print(l);
  var c = Matrix.fromList(l.cast());
  print(c.toList());
  // List l = B.inverse();
  // l.add([4, 5]);
  //print(m1);
  // print(B.inverse());
}
