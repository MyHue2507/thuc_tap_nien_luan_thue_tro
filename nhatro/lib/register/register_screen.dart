import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nhatro/login/login_screen.dart';
import 'package:nhatro/services/authentication.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var _controller = TextEditingController();
  Color _colorOrange = Color.fromARGB(255, 255, 221, 127);
  Color _color = Colors.white;
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

  String _userName;
  String _email;
  String _password;

  String _errorMessage;
  bool _isLoading = false;

  BaseAuth auth = Auth();
  String userId = "";

  @override
  Widget build(BuildContext context) {
    Widget _showCircularProgress() {
      if (_isLoading) {
        print('aaaaaaaaaaaaaaaa');
        return Center(child: CircularProgressIndicator());
      }
      return Container(
        height: 0.0,
        width: 0.0,
      );
    }

    Future _addUserNameKey(String userName, String email) async {
      final DocumentReference documentReference =
          Firestore.instance.document("userNameKey/$userName");
      Map<String, String> data = <String, String>{
        "email": email,
      };
      await documentReference.setData(data).whenComplete(() {
        print("Document Added");
      }).catchError((e) => print(e));
    }

    void _addNewUser(String userId, String userName, String email) async {
      final DocumentReference documentReference =
          Firestore.instance.document("users/$userId");
      Map<String, String> data = <String, String>{
        "email": email,
        "userId": userId,
        "username": userName
      };
      await documentReference.setData(data).whenComplete(() {
        print("Document Added");
      }).catchError((e) => print(e));
    }

    Future _showVerifyEmailSentDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Verify your account"),
            content:
                new Text("Link to verify account has been sent to your email"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Dismiss"),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => SignInScreen()));
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.cyan,
      body: Container(
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
                'Sign Up',
                style: TextStyle(
                    fontWeight: FontWeight.w300, fontSize: 16, color: _color),
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
              alignment: Alignment(0, -0.8),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    // controller: _controller,
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
                      print(value);
                      _userName = value;
                    },
                    // validator: (value) =>
                    //     value.isEmpty ? 'User name can\'t be empty' : null,
                    // onSaved: (value) {_email = value;
                    // print(_controller.text);} ,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: _color,
                    style: TextStyle(color: _color),
                    decoration: InputDecoration(
                        icon: Image.asset(
                          'images/email_icon.png',
                          height: 19.44,
                          width: 16.88,
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w200, color: _color)),
                    // validator: (value) =>
                    //     value.isEmpty ? 'Email can\'t be empty' : null,
                    // onSaved: (value) => _email = value,
                    onChanged: (value) {
                      print(value);
                      _email = value;
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
                    // validator: (value) =>
                    //     value.isEmpty ? 'Password can\'t be empty' : null,
                    // onSaved: (value) => _email = value,
                    onChanged: (value) {
                      print(value);
                      _password = value;
                    },
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 5),
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
                  setState(() {
                    _errorMessage = "";
                    _isLoading = true;
                  });

                  final QuerySnapshot result = await Firestore.instance
                      .collection('users')
                      .where('username', isEqualTo: _userName)
                      .getDocuments();
                  final List<DocumentSnapshot> documents = result.documents;

                  if (documents.length == 0) {
                    // userName chua ton tai
                    try {
                      userId = await auth.signUp(_email, _password).then((uid) {
                        if (uid.length > 0 && userId != null) {
                          _addNewUser(uid, _userName, _email);
                          _addUserNameKey(_userName, _email);
                        }
                      });
                      auth.sendEmailVerification();
                      _showVerifyEmailSentDialog();
                      print('Signed up user: $userId');
                      setState(() {
                        _isLoading = false;
                      });
                    } catch (e) {
                      print('Error: $e');
                      setState(() {
                        _isLoading = false;
                        _errorMessage = e.message;
                        print('Errorrrrrrrrr: $_errorMessage');
                      });
                    }
                  } else {
                    setState(() {
                      _isLoading = false;
                      _errorMessage = 'User name already exists';
                      print('Errorrrrrrrrr: $_errorMessage');
                    });
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      color: _colorOrange,
                      borderRadius: BorderRadius.circular(2)),
                  child: Center(
                      child: Text(
                    'Sign Up',
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
                    'Already have an account?',
                    style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: _color,
                        fontSize: 11),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => SignInScreen())),
                    child: Container(
                      height: 12,
                      width: 37,
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: _color))),
                      child: Text('Sign In',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: _color,
                              fontSize: 11)),
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
      ),
    );
  }
}
