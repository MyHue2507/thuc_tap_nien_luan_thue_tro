import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nhatro/model/phong.dart';

class GhepTro {
  Future onGhepTro(Phong phong) async {
    int dateCreate = DateTime.now().millisecondsSinceEpoch;
    String phongId = dateCreate.toString();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await _auth.currentUser();
    DocumentReference documentReferenceListPhongOfUser = Firestore.instance
        .document("users/${firebaseUser.uid}/listPhongGhep/$phongId");
    Map<String, String> data = <String, String>{
      "ten":phong.ten,
      "userNameOfHost": phong.userNameOfHost,
      "uidOfHost": phong.uidOfHost,
      "avatarOfHost": phong.avatarOfHost,
      "phongId": phongId,
      "gioiTinh": phong.gioiTinh,
      "moTa": phong.moTa,
      "gia": phong.gia.toString(),
      "searchKey":phong.gioiTinh.substring(0,1),
      "diaChi": phong.diaChi,
      "sdt": phong.sdt
    };
    DocumentReference documentReferenceAllListPhong =
        Firestore.instance.document("listPhongGhep/$phongId");
    Map<String, String> data2 = <String, String>{
      "ten":phong.ten,
      "userNameOfHost": phong.userNameOfHost,
      "uidOfHost": phong.uidOfHost,
      "avatarOfHost": phong.avatarOfHost,
      "phongId": phongId,
      "moTa": phong.moTa,
      "gioiTinh": phong.gioiTinh,
      "gia": phong.gia.toString(),
      "searchKey": phong.gioiTinh.substring(0,1),
      "diaChi": phong.diaChi,
      "sdt": phong.sdt
    };
    await documentReferenceListPhongOfUser.setData(data).whenComplete(() {
      print("Document Added");
    }).catchError((e) => print(e));
    await documentReferenceAllListPhong.setData(data2).whenComplete(() {
      print("Document Added");
    }).catchError((e) => print(e));
  }
}
