import 'package:flutter/material.dart';

class MyAccountScreen extends StatefulWidget {
  @override
  MyAccountScreenState createState() => MyAccountScreenState();
}

class MyAccountScreenState extends State<MyAccountScreen> {
  Color _colorWhite = Colors.white;
  Color _colorApp = Color.fromARGB(255, 45, 53, 110);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: _colorApp,
        elevation: 1,
        centerTitle: true,
        leading: Container(
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ),
        title: Container(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            'Tài khoản của tôi',
            style: TextStyle(
              fontSize: 16,
              color: _colorWhite,
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Container(
                padding:
                    EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://www.kairoscanada.org/wp-content/uploads/2017/01/mountain-300x225.jpeg'),
                        radius: 40,
                      ),
                    ),
                   
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[200]),
                      margin: EdgeInsets.only(
                          top: 10, left: 5.0, right: 5.0, bottom: 5.0),
                      height: 50.0,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        padding: EdgeInsets.only(top: 15, left: 10),
                        child: Text(
                          'Tên người dùng',
                          style: TextStyle(fontSize: 15, color: Colors.black45),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[200]),
                      margin: EdgeInsets.only(
                          top: 10, left: 5.0, right: 5.0, bottom: 5.0),
                      height: 50.0,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        padding: EdgeInsets.only(top: 15, left: 10),
                        child: Text(
                          'Họ',
                          style: TextStyle(fontSize: 15, color: Colors.black45),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[200]),
                      margin: EdgeInsets.only(
                          top: 10, left: 5.0, right: 5.0, bottom: 5.0),
                      height: 50.0,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        padding: EdgeInsets.only(top: 15, left: 10),
                        child: Text(
                          'Tên',
                          style: TextStyle(fontSize: 15, color: Colors.black45),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[200]),
                      margin: EdgeInsets.only(
                          top: 10, left: 5.0, right: 5.0, bottom: 5.0),
                      height: 50.0,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        padding: EdgeInsets.only(top: 15, left: 10),
                        child: Text(
                          'Số điện thoại',
                          style: TextStyle(fontSize: 15, color: Colors.black45),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[200]),
                      margin: EdgeInsets.only(
                          top: 10, left: 5.0, right: 5.0, bottom: 5.0),
                      height: 50.0,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        padding: EdgeInsets.only(top: 15, left: 10),
                        child: Text(
                          'Địa chỉ',
                          style: TextStyle(fontSize: 15, color: Colors.black45),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
