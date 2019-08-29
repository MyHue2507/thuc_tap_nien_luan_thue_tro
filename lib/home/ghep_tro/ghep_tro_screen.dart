import 'package:flutter/material.dart';
import 'package:nhatro/home/ghep_tro/detail_user.dart';
import 'package:nhatro/home/ghep_tro/tao_thong_tin.dart';
import 'package:nhatro/model/user.dart';
import 'package:nhatro/services/call.dart';
import 'package:nhatro/services/service.dart';

class GhepTroScreen extends StatefulWidget {
  User userCurrent;
  GhepTroScreen({Key key, this.userCurrent}) : super(key: key);

  _GhepTroScreenState createState() => _GhepTroScreenState();
}

class _GhepTroScreenState extends State<GhepTroScreen> {
  Color colorRed = Colors.redAccent;
  Color _colorApp = Color.fromARGB(255, 45, 53, 110);
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: BorderDirectional(
                bottom: BorderSide(
                  color: Colors.grey,
                ),
              )),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: RaisedButton(
                color: Colors.grey[400],
                child: Text('Đăng thông tin ghép trọ'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => CreateInfoScreen(
                            userCurrent: widget.userCurrent,
                          )));
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: BorderDirectional(
                bottom: BorderSide(
                  color: Colors.grey,
                ),
              )),
              // padding: EdgeInsets.all(10),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => DetailUserScreen()));
                },
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://www.kairoscanada.org/wp-content/uploads/2017/01/mountain-300x225.jpeg'),
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
                                  'Name,',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: colorRed,
                                      fontSize: 16),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                child: Text('Nam'),
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
                              '500000đ-1000000đ',
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
                              '143 Phan Bội Châu, tp.Huế',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Text('Số điện thoại: '),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                            child: Text(
                              '0123456789',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Text('Mô tả: '),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                            child: Text(
                              'Tự quản',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
          ],
        ),
      ],
    ));
  }

 

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
                                _service.call("0123456788");
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
                                _service.sendSms("0123456789");
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
}
