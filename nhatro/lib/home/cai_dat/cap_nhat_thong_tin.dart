import 'package:flutter/material.dart';

class UpdateInfoScreen extends StatefulWidget {
  @override
  UpdateInfoScreenState createState() => UpdateInfoScreenState();
}

class UpdateInfoScreenState extends State<UpdateInfoScreen> {
  Color _colorWhite = Colors.white;
  Color _colorApp = Color.fromARGB(255, 45, 53, 110);
  TextEditingController username;
  TextEditingController ho;
  TextEditingController ten;
  TextEditingController sdt;
  TextEditingController diaChi;

  @override
  void dispose() {
    super.dispose();
    username.dispose();
    ho.dispose();
    ten.dispose();
    sdt.dispose();
    diaChi.dispose();
  }

  @override
  void initState() {
    super.initState();
    username = TextEditingController();
    ho = TextEditingController();
    ten = TextEditingController();
    sdt = TextEditingController();
    diaChi = TextEditingController();
  }
  

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
            'Cập nhật thông tin',
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
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[200]),
                      margin: EdgeInsets.only(
                          top: 10, left: 5.0, right: 5.0, bottom: 5.0),
                      height: 50.0,
                      child: TextField(
                          controller: username,
                        
                     
                          decoration: (InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Tên người dùng',
                            hintStyle: TextStyle(fontSize: 15.0),
                            contentPadding: EdgeInsets.only(top: 15, left: 10),
                          ))),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[200]),
                      margin: EdgeInsets.only(
                          top: 10, left: 5.0, right: 5.0, bottom: 5.0),
                      height: 50.0,
                      child: TextField(
                          controller: ho,
                   
                          decoration: (InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Họ',
                            hintStyle: TextStyle(fontSize: 15.0),
                            contentPadding: EdgeInsets.only(top: 15, left: 10),
                          ))),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[200]),
                      margin: EdgeInsets.only(
                          top: 10, left: 5.0, right: 5.0, bottom: 5.0),
                      height: 50.0,
                      child: TextField(
                          controller: ten,
                    
                 
                          decoration: (InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Tên',
                            hintStyle: TextStyle(fontSize: 15.0),
                            contentPadding: EdgeInsets.only(top: 15, left: 10),
                          ))),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[200]),
                      margin: EdgeInsets.only(
                          top: 10, left: 5.0, right: 5.0, bottom: 5.0),
                      height: 50.0,
                      child: TextFormField(
                          controller: sdt,
                      
                        
                          decoration: (InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Số điện thoại',
                            hintStyle: TextStyle(fontSize: 15.0),
                            contentPadding: EdgeInsets.only(top: 15, left: 10),
                          ))),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[200]),
                      margin: EdgeInsets.only(
                          top: 10, left: 5.0, right: 5.0, bottom: 5.0),
                      height: 50.0,
                      child: TextField(
                          controller: diaChi,
                
                    
                          decoration: (InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Địa chỉ',
                            hintStyle: TextStyle(fontSize: 15.0),
                            contentPadding: EdgeInsets.only(top: 15, left: 10),
                          ))),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 50, bottom: 40, left: 20, right: 20),
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () async {},
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                              color: _colorApp,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                              child: Text(
                            'Cập nhật',
                            style: TextStyle(color: Colors.white),
                          )),
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
