import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  ChangePasswordScreenState createState() => ChangePasswordScreenState();
}

class ChangePasswordScreenState extends State<ChangePasswordScreen> {
  Color _colorWhite = Colors.white;
  Color _colorApp = Color.fromARGB(255, 45, 53, 110);
  GlobalKey<FormState> _key = new GlobalKey();
  TextEditingController password;
  TextEditingController newPassword;
  TextEditingController confirmPassword;
  bool _validate = false;
  bool obscureText1 = true;
  bool obscureText2 = true;
  bool obscureText3 = true;

  void _toggle1() {
    setState(() {
      obscureText1 = !obscureText1;
    });
  }
  void _toggle2() {
    setState(() {
      obscureText2 = !obscureText2;
    });
  }
  void _toggle3() {
    setState(() {
      obscureText3 = !obscureText3;
    });
  }

  @override
  void dispose() {
    super.dispose();
    password.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
  }

  @override
  void initState() {
    super.initState();
    password = TextEditingController();
    newPassword = TextEditingController();
    confirmPassword = TextEditingController();
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
            'Đổi mật khẩu',
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
              Form(
                key: _key,
                autovalidate: _validate,
                child: Container(
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
                        child: TextFormField(
                            controller: password,
                            obscureText: obscureText1,
                            validator: validatePassword,
                            decoration: (InputDecoration(
                              suffix: GestureDetector(
                                onTap: () {
                                  _toggle1();
                                },
                                child: Container(
                                  height: 20,
                                  width: 40,
                                  margin: EdgeInsets.only(top: 10, right: 10),
                                  child: Text(obscureText1 ? "Show" : "Hide"),
                                ),
                              ),
                              border: InputBorder.none,
                              hintText: 'Nhập mật khẩu hiện tại',
                              hintStyle: TextStyle(fontSize: 15.0),
                              contentPadding: EdgeInsets.only(top: 5, left: 10),
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
                            controller: newPassword,
                            obscureText: obscureText2,
                            validator: validatePassword,
                            decoration: (InputDecoration(
                              suffix: GestureDetector(
                                onTap: () {
                                  _toggle2();
                                },
                                child: Container(
                                  height: 20,
                                  width: 40,
                                  margin: EdgeInsets.only(top: 10, right: 10),
                                  child: Text(obscureText2 ? "Show" : "Hide"),
                                ),
                              ),
                              border: InputBorder.none,
                              hintText: 'Nhập mật khẩu mới',
                              hintStyle: TextStyle(fontSize: 15.0),
                              contentPadding:
                                  EdgeInsets.only(top: 5, left: 10),
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
                            controller: confirmPassword,
                            obscureText: obscureText3,
                            validator: validatePassword,
                            decoration: (InputDecoration(
                              suffix: GestureDetector(
                                onTap: () {
                                  _toggle3();
                                },
                                child: Container(
                                  height: 20,
                                  width: 40,
                                  margin: EdgeInsets.only(top: 10, right: 10),
                                  child: Text(obscureText3 ? "Show" : "Hide"),
                                ),
                              ),
                              border: InputBorder.none,
                              hintText: 'Xác nhận mật khẩu mới',
                              hintStyle: TextStyle(fontSize: 15.0),
                              contentPadding: EdgeInsets.only(top: 5,left: 10),
                            ))),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 30, bottom: 40, left: 40, right: 40),
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () async {
                    if (_key.currentState.validate()) {
                      // No any error in validation
                      _key.currentState.save();
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
                      'Xác nhận',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String validatePassword(String value) {
    String patttern = r'(^[a-zA-Z0-9 ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Vui lòng nhập mật khẩu";
    } else if (value.length < 6) {
      return "Mật khẩu phải nhiều hơn 6 kí tự";
    } else if (!regExp.hasMatch(value)) {
      return "Mật khẩu phải là chữ thường, chữ hoa hoặc số";
    }
    return null;
  }
}
