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
  bool _validate = false;
  bool isSelected = false;
  GlobalKey<FormState> _key = new GlobalKey();
  var _defaultTro = 'Phòng trọ cho thuê';
  var listTro = [
    'Phòng trọ cho thuê',
    'Nhà nguyên căn cấp 4',
    'Nhà hộp',
    'Nhà 2 tầng',
  ];

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
                      child: Form(
                        autovalidate: _validate,
                        key: _key,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.grey[200]),
                                margin: EdgeInsets.only(
                                    top: 20,
                                    left: 5.0,
                                    right: 5.0,
                                    bottom: 5.0),
                                height: 50.0,
                                width: MediaQuery.of(context).size.width,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: _defaultTro,
                                    onChanged: (String newValueSelected) {
                                      setState(() {
                                        _defaultTro = newValueSelected;
                                        setState(() {
                                          isSelected = true;
                                        });
                                      });
                                    },
                                    items:
                                        listTro.map((String dropDownListItem) {
                                      return DropdownMenuItem<String>(
                                        value: dropDownListItem,
                                        child: Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text(
                                            dropDownListItem,
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.grey[200]),
                                margin: EdgeInsets.only(
                                    top: 20,
                                    left: 5.0,
                                    right: 5.0,
                                    bottom: 5.0),
                                height: 50.0,
                                child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    validator: validateGia,
                                    controller: gia,
                                    decoration: (InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Giá (đơn vị: VNĐ)',
                                      hintStyle: TextStyle(fontSize: 15.0),
                                      contentPadding:
                                          EdgeInsets.only(top: 15, left: 10),
                                    ))),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.grey[200]),
                                margin: EdgeInsets.only(
                                    top: 20,
                                    left: 5.0,
                                    right: 5.0,
                                    bottom: 5.0),
                                height: 50.0,
                                child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    validator: validateSucchua,
                                    controller: sucChua,
                                    decoration: (InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Sức chứa',
                                      hintStyle: TextStyle(fontSize: 15.0),
                                      contentPadding:
                                          EdgeInsets.only(top: 15, left: 10),
                                    ))),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.grey[200]),
                                margin: EdgeInsets.only(
                                    top: 20,
                                    left: 5.0,
                                    right: 5.0,
                                    bottom: 5.0),
                                height: 50.0,
                                child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: dienTich,
                                    validator: validateDientich,
                                    decoration: (InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Diện tích (đơn vị: mét vuông)',
                                      hintStyle: TextStyle(fontSize: 15.0),
                                      contentPadding:
                                          EdgeInsets.only(top: 15, left: 10),
                                    ))),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.grey[200]),
                                margin: EdgeInsets.only(
                                    top: 20,
                                    left: 5.0,
                                    right: 5.0,
                                    bottom: 5.0),
                                height: 50.0,
                                child: TextFormField(
                                    controller: sdt,
                                    keyboardType: TextInputType.number,
                                    validator: validateSDT,
                                    decoration: (InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Số điện thoại',
                                      hintStyle: TextStyle(fontSize: 15.0),
                                      contentPadding:
                                          EdgeInsets.only(top: 15, left: 10),
                                    ))),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.grey[200]),
                                margin: EdgeInsets.only(
                                    top: 20,
                                    left: 5.0,
                                    right: 5.0,
                                    bottom: 5.0),
                                height: 50.0,
                                child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: diaChi,
                                    validator: validateDiachi,
                                    decoration: (InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Địa chỉ',
                                      hintStyle: TextStyle(fontSize: 15.0),
                                      contentPadding:
                                          EdgeInsets.only(top: 15, left: 10),
                                    ))),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.grey[200]),
                                margin: EdgeInsets.only(
                                    top: 20,
                                    left: 5.0,
                                    right: 5.0,
                                    bottom: 5.0),
                                // height: 50.0,
                                child: TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    // validator: validateMota,
                                    maxLines: 5,
                                    controller: moTa,
                                    decoration: (InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Mô tả',
                                      hintStyle: TextStyle(fontSize: 15.0),
                                      contentPadding:
                                          EdgeInsets.only(top: 15, left: 10),
                                    ))),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 10,
                                    left: 10.0,
                                    right: 5.0,
                                    bottom: 5.0),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.add_box,
                                    ),
                                    FlatButton(
                                      child: Text("Thêm ảnh"),
                                      onPressed: () {},
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 0, left: 20, right: 20),
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () async {
                          if (_key.currentState.validate()) {
                            _key.currentState.save();
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
                          }
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

  String validateDiachi(String value) {
    if (value.length == 0) {
      return "Nhập vào địa chỉ";
    }
    return null;
  }

  String validateMota(String value) {
    if (value.length == 0) {
      return "Nhập vào mô tả";
    }
    return null;
  }

  String validateGia(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Nhập vào giá tiền";
    } else if (value.length < 0) {
      return "Giá tiền là không âm";
    } else if (!regExp.hasMatch(value)) {
      return "Giá tiền phải là chữ số";
    }
    return null;
  }

  String validateSucchua(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Nhập vào sức chứa";
    } else if (value.length < 1) {
      return "Sức chứa phải từ 1 người trở lên";
    } else if (!regExp.hasMatch(value)) {
      return "Sức chứa phải là chữ số";
    }
    return null;
  }

  String validateDientich(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Nhập vào diện tích";
    } else if (value.length < 10) {
      return "Diện tích tối thiểu là 10m2";
    } else if (!regExp.hasMatch(value)) {
      return "Diện tích phải là chữ số";
    }
    return null;
  }

  String validateSDT(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Nhập vào số điện thoại";
    } else if (value.length != 10) {
      return "Số điện thoại phải gồm 10 số";
    } else if (!regExp.hasMatch(value)) {
      return "Số điện thoại phải là chữ số";
    }
    return null;
  }
}
