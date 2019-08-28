import 'package:flutter/material.dart';
import 'package:nhatro/home/ghep_tro/detail_user.dart';
import 'package:nhatro/home/ghep_tro/tao_thong_tin.dart';
import 'package:nhatro/model/user.dart';

class GhepTroScreen extends StatefulWidget {
  User userCurrent;
  GhepTroScreen({Key key, this.userCurrent}) : super(key: key);

  _GhepTroScreenState createState() => _GhepTroScreenState();
}

class _GhepTroScreenState extends State<GhepTroScreen> {
  Color colorRed = Colors.redAccent;
  Color _colorApp = Color.fromARGB(255, 45, 53, 110);
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
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.kairoscanada.org/wp-content/uploads/2017/01/mountain-300x225.jpeg'),
                      radius: 50,
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
}
