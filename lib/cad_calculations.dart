import 'package:ml_linalg/linalg.dart';
import 'package:linalg/linalg.dart' as linalg;

class Calculations {
  //BZ_b B^TI_l   =  BE_b   − BZ_b I_b
  List<Map> branches = [];
  List<double> Jb = [];
  List<double> Vb = [];
  List<List<double>> AT = [];
  List<List<double>> AL = [];
  List<List<double>> _B = [];
  List<List<double>> _C = [];
  List<double> _Zb = [];
  List<double> _Eb = [];
  List<double> _Ib = [];
  Calculations(
      {required this.branches,
      required List<double> Zb,
      required List<double> Eb,
      required List<double> Ib}) {
    this._Zb = Zb;
    this._Ib = Ib;
    this._Eb = Eb;
    setIncidenceMat();
    setTieSetMat();
    setBranchVoltage();
  }

  void setIncidenceMat() {
    int branchs_num = branches.length;
    Set nodes = {};
    for (var ele in branches) {
      nodes.add(ele["start"]);
      nodes.add(ele["end"]);
    }
    int nodes_num = nodes.length;
    int links = branchs_num - nodes_num + 1;
    int trees = branchs_num - links;

    var A_T = linalg.Matrix.fill(trees, trees).toList();

    var A_L = linalg.Matrix.fill(trees, links).toList();

    for (var row = 0; row < trees; row++) {
      int start = branches[row]["start"];
      int end = branches[row]["end"];
      if (A_T[row].length >= start) A_T[row][start - 1] = 1;
      if (A_T[row].length >= end) A_T[row][end - 1] = -1;
    }

    for (var row = trees; row < branches.length; row++) {
      int start = branches[row]["start"];
      int end = branches[row]["end"];
      if (A_L[row - trees].length >= start) A_L[row - trees][start - 1] = 1;
      if (A_L[row - trees].length >= end) A_L[row - trees][end - 1] = -1;
    }
    AT = linalg.Matrix(A_T).transpose().toList();
    AL = linalg.Matrix(A_L).transpose().toList();
    print("AT:$AT");
    print("AL:$AL");
  }

  void setTieSetMat() {
    var ATree = linalg.Matrix(AT);
    var ALink = linalg.Matrix(AL);
    var CLink = ATree.inverse() * ALink; //cut set links

    var CT = Matrix.identity(AT[0].length)
        .toList()
        .cast<List<double>>(); //cut set tree
    CT.addAll(CLink.transpose().toList()); //cut set transposed

    _C = linalg.Matrix(CT).transpose().toList(); //cut set
    List<List<double>> BT = (CLink * -1).toList(); //tie set tree transpose

    var BLink = Matrix.identity(AL[0].length)
        .toList()
        .cast<List<double>>(); //tie set link
    BT.addAll(BLink); //tie set transpose
    _B = linalg.Matrix(BT).transpose().toList(); //tie set
  }

  List getTieSetMat() {
    return _B;
  }

  List getCutSetMat() {
    return _C;
  }

  void setBranchVoltage() {
    var BMat = linalg.Matrix(_B);
    var ZbMat = linalg.Matrix(Matrix.diagonal(_Zb).toList().cast());
    var EbMat = linalg.Matrix(Matrix.column(_Eb).toList().cast());
    var IbMat = linalg.Matrix(Matrix.column(_Ib).toList().cast());
    var BZbBT = BMat * ZbMat * BMat.transpose();
    print(
      "BZbBT: $BZbBT",
    );
    var BEb = BMat * EbMat;
    print("BEb: $BEb");
    var BZbIb = BMat * ZbMat * IbMat;
    print("BZbIb : $BZbIb");
    var Il = BZbBT.inverse() * (BEb - BZbIb);

    print("Il: ${Il}");
    var JbMat = BMat.transpose() * Il;
    Jb = JbMat.toVector().toList();
    print("Jb: $Jb");
    var VbMat = ZbMat * (JbMat + IbMat) - EbMat;
    Vb = VbMat.toVector().toList();
    print("vb: $Vb");
  }
}
