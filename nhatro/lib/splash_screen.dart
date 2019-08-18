import 'dart:async';

import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:nhatro/login/login_screen.dart';

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

  Future navigationPage() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // int isCameIntro = (sharedPreferences.getInt('isCameIntro') ?? 0);
    // if (isCameIntro == 0) {
    //   Navigator.of(context).pushAndRemoveUntil(
    //       MaterialPageRoute(builder: (_) => IntroScreen()),
    //       (Route<dynamic> route) => false);
    //   isCameIntro = 1;
    // } else if (_accessToken != null && _accessToken != "")
    //   Navigator.of(context).pushAndRemoveUntil(
    //       MaterialPageRoute(
    //           builder: (_) => HomeScreen(
    //                 accessToken: _accessToken,
    //               )),
    //       (Route<dynamic> route) => false);
    // else
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => SignInScreen()),
        (Route<dynamic> route) => false);
    // await sharedPreferences.setInt('isCameIntro', isCameIntro);
  }

  @override
  void initState() {
    // LoginRegesTer().saveaccessToken().then((accessToken) {
    //   GetUserByToken().getUserByToken(accessToken).then((user) {
    //     if (user != null)
    //       _accessToken = accessToken;
    //     else
    //       _accessToken = null;
    //   });
    // });
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
