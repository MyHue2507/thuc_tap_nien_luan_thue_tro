import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nhatro/home/home_screen.dart';
import 'package:nhatro/register/register_screen.dart';
import 'package:nhatro/services/authentication.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  Color _color = Colors.white;
  Color _colorOrange = Color.fromARGB(255, 255, 221, 127);
  List<Color> _listColor = [
    Color.fromARGB(200, 45, 110, 180),
    Color.fromARGB(200, 45, 80, 150),
    Color.fromARGB(200, 45, 60, 130),
    Color.fromARGB(200, 45, 60, 120),
    Color.fromARGB(200, 45, 53, 110),
    Color.fromARGB(200, 45, 53, 110),
    Color.fromARGB(200, 45, 53, 110),
    Color.fromARGB(200, 45, 60, 120),
    Color.fromARGB(200, 45, 60, 130),
    Color.fromARGB(200, 45, 80, 150),
    Color.fromARGB(200, 45, 110, 180),
  ];
  // Color.fromARGB(200, 0, 203, 230),
  // Color.fromARGB(200, 0, 180, 204),
  // Color.fromARGB(200, 0, 158, 179),
  // Color.fromARGB(200, 0, 158, 179),
  // Color.fromARGB(200, 0, 135, 153),
  // Color.fromARGB(200, 0, 135, 153),
  // Color.fromARGB(200, 0, 135, 153),
  // Color.fromARGB(200, 0, 158, 179),
  // Color.fromARGB(200, 0, 158, 179),
  // Color.fromARGB(200, 0, 180, 204),
  // Color.fromARGB(200, 0, 203, 230),

  BaseAuth auth = Auth();
  String _errorMessage;
  bool _isLoading = false;
  String _userName;
  String _email;
  String _password;

  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLogged = false;

  FirebaseUser myUser;

  Future getEmail() async {
    await Firestore.instance
        .collection('userNameKey')
        .document(_userName)
        .get()
        .then((snapshot) {
      if (snapshot.exists == false) {
        setState(() {
          _isLoading = false;
          _email = "";
          _errorMessage = 'Username does not exist';
        });
      } else {
        var email = snapshot['email'];
        _email = email;
      }

      return _email;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _showCircularProgress() {
      if (_isLoading) {
        return Center(child: CircularProgressIndicator());
      }
      return Container(
        height: 0.0,
        width: 0.0,
      );
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.cyan,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: _listColor,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 30),
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: _color),
                  ),
                ),
                Align(
                  child: Container(
                    margin: EdgeInsets.only(top: 100),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Motel",
                          style: TextStyle(color: _colorOrange, fontSize: 20),
                        ),
                        Icon(
                          Icons.not_listed_location,
                          color: Colors.white,
                          size: 100,
                        ),
                        Container(
                          height: 10,
                        ),
                        Text(
                          "Tìm nhà cùng bạn!",
                          style: TextStyle(color: _colorOrange, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  alignment: Alignment(0, -0.7),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  // alignment: Alignment.,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        cursorColor: _color,
                        style: TextStyle(color: _color),
                        decoration: InputDecoration(
                            icon: Image.asset(
                              'images/username_icon.png',
                              height: 19.44,
                            ),
                            hintText: 'User Name',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w200, color: _color)),
                        onChanged: (value) {
                          _userName = value;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        cursorColor: _color,
                        style: TextStyle(color: _color),
                        obscureText: true,
                        decoration: InputDecoration(
                            icon: Image.asset(
                              'images/password_icon.png',
                              width: 17.61,
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w200, color: _color)),
                        onChanged: (value) {
                          _password = value;
                        },
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 5, left: 80),
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "${_errorMessage ?? ""}",
                            style: TextStyle(
                                color: Colors.grey[300],
                                fontSize: 10,
                                fontWeight: FontWeight.w300),
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 40, left: 20, right: 20),
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () async {
                      if (_userName == null ||
                          _userName == "" ||
                          _password == null ||
                          _password == "") {
                        setState(() {
                          _errorMessage = "PassWord or Email not is empty";
                        });
                      } else {
                        setState(() {
                          _isLoading = true;
                        });
                        String userId = "";
                        await getEmail();
                        // if (_email != "") {
                        try {
                          userId = await auth.signIn(_email, _password);
                          print('Signed in: $userId');
                          setState(() {
                            _isLoading = false;
                          });
                          if (userId.length > 0 && userId != null) {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (_) => HomeScreen(
                                          baseAuth: auth,
                                        )));
                          }
                        } catch (e) {
                          print('Error: $e');
                          setState(() {
                            _isLoading = false;
                            _errorMessage = e.message;
                          });
                        }
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                          // color: Color.fromARGB(1000, 77, 208, 225),
                          color: _colorOrange,
                          borderRadius: BorderRadius.circular(2)),
                      child: Center(
                          child: Text(
                        'Sign In',
                        style: TextStyle(color: _color),
                      )),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 15),
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Dont\'t have an account?',
                        style: TextStyle(
                            fontWeight: FontWeight.w200,
                            color: _color,
                            fontSize: 11),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => SignUpScreen())),
                        child: Container(
                          height: 12,
                          width: 40,
                          margin: EdgeInsets.only(left: 5, right: 5),
                          decoration: BoxDecoration(
                              border:
                                  Border(bottom: BorderSide(color: _color))),
                          child: Text('Sign up',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: _color,
                                  fontSize: 11)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          _isLoading
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.height)
              : Container(
                  height: 0.0,
                  width: 0.0,
                ),
          _showCircularProgress()
        ],
      ),
    );
  }
}
