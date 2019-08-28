import 'dart:async';

import 'package:animator/animator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nhatro/home/home_screen.dart';
import 'package:nhatro/login/login_screen.dart';
import 'package:nhatro/services/authentication.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color _colorApp = Color.fromARGB(255, 45, 53, 110);
  Color _colorOrange = Color.fromARGB(255, 255, 221, 127);
  startTime() async {
    var _duration = new Duration(seconds: 5);
    return Timer(_duration, navigationPage);
  }

  FirebaseUser firebaseUser;
  void isSignedIn() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    firebaseUser = await _auth.currentUser();
  }

  BaseAuth auth = Auth();
  Future navigationPage() async {
    firebaseUser == null
        ? Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => SignInScreen()),
            (Route<dynamic> route) => false)
        : Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (_) => HomeScreen(
                      baseAuth: auth,
                    )),
            (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    isSignedIn();
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: _colorApp,
        child: Animator(
          tweenMap: {
            "opacityDisappear": Tween<double>(begin: 0, end: 1),
          },
          cycles: 0,
          repeats: 0,
          duration: Duration(seconds: 5),
          builderMap: (Map<String, dynamic> amin) {
            return FadeTransition(
              opacity: amin["opacityDisappear"],
              child: Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Motel",
                      style: TextStyle(color: _colorOrange, fontSize: 24),
                    ),
                    Icon(
                      Icons.not_listed_location,
                      color: Colors.white,
                      size: 150,
                    ),
                    Container(
                      height: 10,
                    ),
                    Text(
                      "Tìm nhà cùng bạn!",
                      style: TextStyle(color: _colorOrange, fontSize: 22),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
