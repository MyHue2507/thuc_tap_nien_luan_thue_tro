import 'package:flutter/material.dart';
import 'package:nhatro/home/thue_tro/onpress_tao_phong.dart';
import 'package:nhatro/model/phong.dart';
import 'package:nhatro/model/user.dart';

class CreateRoomScreen extends StatefulWidget {
  User userCurrent;
  CreateRoomScreen({Key key, this.userCurrent}) : super(key: key);
  @override
  CreateRoomScreenState createState() => CreateRoomScreenState();
}

class CreateRoomScreenState extends State<CreateRoomScreen> {
  Color _colorApp = Color.fromARGB(255, 45, 53, 110);
  TextEditingController loaiNha;
  TextEditingController sucChua;
  TextEditingController dienTich;
  TextEditingController diaChi;
  TextEditingController gia;
  TextEditingController sdt;
  TextEditingController moTa;
  Color colorWhite = Colors.white;
  Color colorB = Color.fromARGB(255, 0, 162, 224);
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    loaiNha = new TextEditingController();
    gia = new TextEditingController();
    sucChua = new TextEditingController();
    dienTich = new TextEditingController();
    diaChi = new TextEditingController();
    sdt = new TextEditingController();
    moTa = new TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    loaiNha.dispose();
    gia.dispose();
    sucChua.dispose();
    dienTich.dispose();
    diaChi.dispose();
    sdt.dispose();
    moTa.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: _colorApp,
        title: Text('Tạo phòng'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Container(
                padding:
                    EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[200]),
                      margin: EdgeInsets.only(
                          top: 20, left: 5.0, right: 5.0, bottom: 5.0),
                      height: 50.0,
                      child: TextField(
                          controller: loaiNha,
                          decoration: (InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Loại nhà trọ',
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
                          top: 20, left: 5.0, right: 5.0, bottom: 5.0),
                      height: 50.0,
                      child: TextField(
                          keyboardType: TextInputType.number,
                          controller: gia,
                          decoration: (InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Giá (đơn vị: VNĐ)',
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
                          top: 20, left: 5.0, right: 5.0, bottom: 5.0),
                      height: 50.0,
                      child: TextField(
                          keyboardType: TextInputType.number,
                          controller: sucChua,
                          decoration: (InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Sức chứa',
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
                          top: 20, left: 5.0, right: 5.0, bottom: 5.0),
                      height: 50.0,
                      child: TextField(
                          keyboardType: TextInputType.number,
                          controller: dienTich,
                          decoration: (InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Diện tích (đơn vị: mét vuông)',
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
                          top: 20, left: 5.0, right: 5.0, bottom: 5.0),
                      height: 50.0,
                      child: TextField(
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
                          top: 20, left: 5.0, right: 5.0, bottom: 5.0),
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
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[200]),
                      margin: EdgeInsets.only(
                          top: 20, left: 5.0, right: 5.0, bottom: 5.0),
                      // height: 50.0,
                      child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          controller: moTa,
                          decoration: (InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Mô tả',
                            hintStyle: TextStyle(fontSize: 15.0),
                            contentPadding: EdgeInsets.only(top: 15, left: 10),
                          ))),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 0, left: 20, right: 20),
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          Phong phong = Phong(
                              diaChi: diaChi.text,
                              dienTich: dienTich.text,
                              gia: gia.text,
                              loaiNhaTro: loaiNha.text,
                              moTa: moTa.text,
                              sdt: sdt.text,
                              sucChua: sucChua.text,
                              uidOfHost: widget.userCurrent.userId,
                              userNameOfHost: widget.userCurrent.userName,
                              avatarOfHost: widget.userCurrent.avatar);
                          await Addphong().onAddphong(phong).then((_) {
                            setState(() {
                              isLoading = false;
                              Navigator.of(context).pop();
                            });
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                              color: _colorApp,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                              child: Text(
                            'Đăng',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          isLoading
              ? Container(
                  color: Colors.grey[100].withOpacity(0.5),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                )
              : Container(),
          isLoading
              ? Container(
                  alignment: Alignment.center,
                  child: Container(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(_colorApp),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
