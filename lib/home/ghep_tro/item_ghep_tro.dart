import 'package:flutter/material.dart';
import 'package:nhatro/home/ghep_tro/detail_user.dart';
import 'package:nhatro/home/ghep_tro/tao_thong_tin.dart';
import 'package:nhatro/model/phong.dart';
import 'package:nhatro/model/user.dart';
import 'package:nhatro/services/call.dart';
import 'package:nhatro/services/service.dart';

class GhepTroItem extends StatefulWidget {
  Phong phong;
  User userCurrent;
  GhepTroItem({Key key, this.phong}) : super(key: key);

  _GhepTroItemState createState() => _GhepTroItemState();
}

class _GhepTroItemState extends State<GhepTroItem> {
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();
  Color _colorApp = Color.fromARGB(255, 45, 53, 110);

  Future<bool> dialogButton(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            titlePadding: EdgeInsets.all(1),
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0)),
            contentPadding: EdgeInsets.all(4),
            title: ListTile(
                onTap: () {},
                title: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                      height: 30,
                      child: Text('Liên hệ'),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: FlatButton(
                              child: Text(
                                'Gọi',
                                style: TextStyle(color: _colorApp),
                              ),
                              onPressed: () {
                                _service.call(widget.phong.sdt);
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          Text('|'),
                          Container(
                            child: FlatButton(
                              child: Text(
                                'Nhắn tin',
                                style: TextStyle(color: _colorApp),
                              ),
                              onPressed: () {
                                _service.sendSms(widget.phong.sdt);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ]),
                  ],
                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: BorderDirectional(
        bottom: BorderSide(
          color: Colors.grey,
        ),
      )),
      // padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 0, top: 10, left: 10, right: 10),
      child: GestureDetector(
        onTap: () {
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (_) => DetailUserScreen()));
        },
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                CircleAvatar(
              backgroundImage: NetworkImage(widget.phong.avatarOfHost ?? ""),
              radius: 50,
            ),
            Container(
                            child: RaisedButton(
                          color: _colorApp,
                          child: Text(
                            'Liên hệ',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            dialogButton(context);
                          },
                        )),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Text(
                          widget.phong.ten ?? "",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.orangeAccent,
                              fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Text(widget.phong.gioiTinh ?? ""),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                    child: Text('Mức giá: '),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                    child: Text(
                      widget.phong.gia + ' VNĐ' ?? "",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                    child: Text('Vị trí: '),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                    child: Text(
                      widget.phong.diaChi ?? "",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
