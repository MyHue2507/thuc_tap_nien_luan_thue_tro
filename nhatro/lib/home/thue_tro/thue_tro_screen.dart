import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nhatro/home/thue_tro/item_thue_tro.dart';
import 'package:nhatro/home/thue_tro/tao_phong.dart';
import 'package:nhatro/model/phong.dart';
import 'package:nhatro/model/user.dart';

class ThueTroScreen extends StatefulWidget {
  User userCurrent;
  ThueTroScreen({Key key, this.userCurrent}) : super(key: key);
  @override
  _ThueTroScreenState createState() => _ThueTroScreenState();
}

class _ThueTroScreenState extends State<ThueTroScreen> {
  Color _colorApp = Color.fromARGB(255, 45, 53, 110);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: RaisedButton(
              color: Colors.grey[400],
              child: Text('Đăng phòng trọ'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => CreateRoomScreen(
                          userCurrent: widget.userCurrent,
                        )));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 50),
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  Firestore.instance.collection('listPhongChoThue').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                      child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(_colorApp),
                  ));
                } else {
                  return snapshot.data.documents.length == 0
                      ? Container()
                      : ListView.builder(
                          itemBuilder: (context, index) {
                            return ThueTroItem(
                              phong: Phong(
                                  diaChi: snapshot.data.documents[index]
                                      ['diaChi'],
                                  dienTich: snapshot.data.documents[index]
                                      ['dienTich'],
                                  gia: snapshot.data.documents[index]['gia'],
                                  loaiNhaTro: snapshot.data.documents[index]
                                      ['loaiNhaTro'],
                                  moTa: snapshot.data.documents[index]['moTa'],
                                  sdt: snapshot.data.documents[index]['sdt'],
                                  sucChua: snapshot.data.documents[index]
                                      ['sucChua'],
                                  uidOfHost: snapshot.data.documents[index]
                                      ['uidOfHost'],
                                  userNameOfHost: snapshot.data.documents[index]
                                      ['userNameOfHost'],
                                  avatarOfHost: snapshot.data.documents[index]
                                      ['avatarOfHost'],
                                  image: snapshot.data.documents[index]
                                      ['image']),
                            );
                          },
                          itemCount:
                              snapshot.data.documents.length,
                        );
                }
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
