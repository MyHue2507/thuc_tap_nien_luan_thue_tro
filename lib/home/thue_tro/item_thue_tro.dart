import 'package:flutter/material.dart';
import 'package:nhatro/model/phong.dart';
import 'package:nhatro/services/call.dart';
import 'package:nhatro/services/service.dart';

class ThueTroItem extends StatefulWidget {
  Phong phong;
  ThueTroItem({Key key, this.phong}) : super(key: key);

  _ThueTroItemState createState() => _ThueTroItemState();
}

class _ThueTroItemState extends State<ThueTroItem> {
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
      margin: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10, left: 10),
            // color: Colors.grey,
            // height: 50,
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage:
                      NetworkImage(widget.phong.avatarOfHost ?? ""),
                  radius: 15,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(widget.phong.userNameOfHost ?? " "),
                )
              ],
            ),
          ),
          Container(
            // color: Colors.blue,
            padding: EdgeInsets.all(10),
            child: Image.asset(
              widget.phong.image ?? " ",
              fit: BoxFit.fill,
              width: double.infinity,
              height:widget.phong.image== null ? 0 : 200.0,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, bottom: 5, right: 10),
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.home),
                    SizedBox(
                      width: 10,
                    ),
                    Text(widget.phong.loaiNhaTro ?? " "),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.attach_money,
                      color: Colors.red,
                    ),
                    Text(
                      "${widget.phong.gia} / 1 tháng",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, bottom: 5),
            alignment: Alignment.bottomLeft,
            child: Row(
              children: <Widget>[
                Icon(Icons.supervisor_account),
                SizedBox(
                  width: 10,
                ),
                Text(widget.phong.sucChua ?? " ")
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, bottom: 5),
            alignment: Alignment.bottomLeft,
            child: Row(
              children: <Widget>[
                Icon(Icons.border_color),
                SizedBox(
                  width: 10,
                ),
                Text(widget.phong.dienTich ?? " ")
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, bottom: 5),
            alignment: Alignment.bottomLeft,
            child: Row(
              children: <Widget>[
                Icon(Icons.location_on),
                SizedBox(
                  width: 10,
                ),
                Text(widget.phong.diaChi ?? " ")
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, bottom: 5),
            alignment: Alignment.bottomLeft,
            child: Row(
              children: <Widget>[
                Icon(Icons.info),
                SizedBox(
                  width: 10,
                ),
                Text(widget.phong.moTa ?? " ")
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, bottom: 5),
            alignment: Alignment.bottomLeft,
            child: Row(
              children: <Widget>[
                Icon(Icons.phone),
                SizedBox(
                  width: 10,
                ),
                Text(widget.phong.sdt ?? " ")
              ],
            ),
          ),
          Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
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
    );
  }
}
