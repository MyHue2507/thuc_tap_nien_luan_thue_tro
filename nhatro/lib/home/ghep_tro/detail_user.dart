import 'package:flutter/material.dart';
import 'package:nhatro/services/call.dart';
import 'package:nhatro/services/service.dart';

class DetailUserScreen extends StatefulWidget {
  @override
  DetailUserScreenState createState() => DetailUserScreenState();
}

class DetailUserScreenState extends State<DetailUserScreen> {
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();
  Color _colorApp = Color.fromARGB(255, 45, 53, 110);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Name'),
          centerTitle: true,
          backgroundColor: _colorApp,
        ),
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: BorderDirectional(
                          bottom: BorderSide(
                    color: Colors.grey,
                  ))),
                  child: Column(
                    children: <Widget>[
                      Container(
                        // color: Colors.blue,
                        // padding: EdgeInsets.all(10),
                        child: Image.network(
                            'https://www.kairoscanada.org/wp-content/uploads/2017/01/mountain-300x225.jpeg'),
                        width: MediaQuery.of(context).size.width,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: BorderDirectional(
                          bottom: BorderSide(
                    color: Colors.grey[300],
                  ))),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Name',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: BorderDirectional(
                          bottom: BorderSide(
                    color: Colors.grey[300],
                  ))),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Giới tính',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Nam',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: BorderDirectional(
                          bottom: BorderSide(
                    color: Colors.grey[300],
                  ))),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Mức giá',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                      
                        child: Text(
                        '500000đ - 1000000đ',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: BorderDirectional(
                          bottom: BorderSide(
                    color: Colors.grey[300],
                  ))),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Vị trí',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        width: 160,
                        child: Text(
                          '143 Phan Bội Châu, tp. Huế',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: BorderDirectional(
                          bottom: BorderSide(
                    color: Colors.grey[300],
                  ))),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Số điện thoại',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                      
                        child: Text(
                          '0123456789',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: BorderDirectional(
                          bottom: BorderSide(
                    color: Colors.grey[300],
                  ))),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Mô tả',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        width: 150,
                        child: Text(
                          'Wifi, tự quản, ...',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 30,
              left: 30,
              right: 30,
              child: GestureDetector(
                onTap: () {
                  dialogButton(context);
                  
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      color: _colorApp,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    'Liên hệ',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            )
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
                                _service.call('0123456789');
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          Text('|'),
                          Container(
                            child: FlatButton(
                              child: Text(
                                'Nhắn tin',
                                style: TextStyle(color:_colorApp),
                              ),
                              onPressed: () {
                               _service.sendSms('0123456789');
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
