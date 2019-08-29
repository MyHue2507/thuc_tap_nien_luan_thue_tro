import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nhatro/model/phong.dart';

class Addphong {
  Future onAddphong(Phong phong) async {
    int dateCreate = DateTime.now().millisecondsSinceEpoch;
    String phongId = dateCreate.toString();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await _auth.currentUser();
    DocumentReference documentReferenceListPhongOfUser = Firestore.instance
        .document("users/${firebaseUser.uid}/listPhongChoThue/$phongId");
    Map<String, String> data = <String, String>{
      "userNameOfHost": phong.userNameOfHost,
      "uidOfHost": phong.uidOfHost,
      "avatarOfHost": phong.avatarOfHost,
      "phongId": phongId,
      "image": phong.image,
      "loaiNhaTro": phong.loaiNhaTro,
      "moTa": phong.moTa,
      "sucChua": phong.sucChua.toString(),
      "gia": phong.gia.toString(),
      "dienTich": phong.dienTich,
      "diaChi": phong.diaChi,
      "sdt": phong.sdt
    };
    DocumentReference documentReferenceAllListPhong =
        Firestore.instance.document("listPhongChoThue/$phongId");
    Map<String, String> data2 = <String, String>{
      "userNameOfHost": phong.userNameOfHost,
      "uidOfHost": phong.uidOfHost,
      "avatarOfHost": phong.avatarOfHost,
      "phongId": phongId,
      "image": phong.image,
      "loaiNhaTro": phong.loaiNhaTro,
      "moTa": phong.moTa,
      "sucChua": phong.sucChua.toString(),
      "gia": phong.gia.toString(),
      "dienTich": phong.dienTich,
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
