import 'package:flutter/material.dart';
import 'package:nhatro/home/ghep_tro/onpress_ghep_tro.dart';
import 'package:nhatro/model/phong.dart';
import 'package:nhatro/model/user.dart';

class CreateInfoScreen extends StatefulWidget {
  User userCurrent;
  CreateInfoScreen({Key key, this.userCurrent}) : super(key: key);
  @override
  CreateInfoScreenState createState() => CreateInfoScreenState();
}

class CreateInfoScreenState extends State<CreateInfoScreen> {
  Color _colorApp = Color.fromARGB(255, 45, 53, 110);
  TextEditingController ten;
  TextEditingController gioiTinh;
  TextEditingController gia;
  TextEditingController viTri;
  TextEditingController sdt;

  TextEditingController moTa;
  Color colorWhite = Colors.white;
  Color colorB = Color.fromARGB(255, 0, 162, 224);

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    ten = new TextEditingController();
    gioiTinh = new TextEditingController();
    gia = new TextEditingController();
    sdt = new TextEditingController();
    viTri = new TextEditingController();

    moTa = new TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    ten.dispose();
    gioiTinh.dispose();
    gia.dispose();
    sdt.dispose();
    viTri.dispose();

    moTa.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: _colorApp,
        title: Text('Tạo thông tin'),
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
                          top: 20, left: 5.0, right: 5.0, bottom: 5.0),
                      height: 50.0,
                      child: TextField(
                          keyboardType: TextInputType.number,
                          controller: gioiTinh,
                          decoration: (InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Giới tính',
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
                            hintText: 'Giá',
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
                          controller: viTri,
                          decoration: (InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Vị trí',
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
                          await GhepTro().onGhepTro(phong).then((_) {
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
