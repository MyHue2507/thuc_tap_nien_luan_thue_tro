import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nhatro/home/ghep_tro/ghep_tro_screen.dart';
import 'package:nhatro/home/cai_dat/setting_screen.dart';
import 'package:nhatro/home/thue_tro/thue_tro_screen.dart';
import 'package:nhatro/login/login_screen.dart';
import 'package:nhatro/model/user.dart';
import 'package:nhatro/services/authentication.dart';

class HomeScreen extends StatefulWidget {
  BaseAuth baseAuth;
  HomeScreen({Key key, this.baseAuth}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color _colorApp = Color.fromARGB(255, 45, 53, 110);
  Color _colorOrange = Color.fromARGB(255, 255, 221, 127);

  bool isThueTro = true, isGhepTro = false, isSetting = false;
  String title = "Thuê - Cho Thuê";

  String setTitle() {
    setState(() {
      isGhepTro
          ? title = "Ghép trọ"
          : isSetting ? title = "Cài đặt" : title = "Thuê - Cho thuê";
    });
    return title;
  }

  Drawer _buildDrawer(context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: _colorApp,
        ),
        child: Stack(
          children: <Widget>[
            ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.only(top: 40, left: 20, right: 50, bottom: 50),
                  child: Container(
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
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 20,
                  ),
                  contentPadding: EdgeInsets.only(left: 50),
                  title: Text('Thuê - Cho thuê',
                      style: TextStyle(color: Colors.white, fontSize: 17)),
                  onTap: () {
                    setState(() {
                      isThueTro = true;
                      isGhepTro = false;
                      isSetting = false;
                      setTitle();
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 50),
                  leading: Icon(
                    Icons.person_add,
                    color: Colors.white,
                    size: 20,
                  ),
                  title: Text(
                    'Ghép trọ',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  onTap: () {
                    setState(() {
                      isThueTro = false;
                      isGhepTro = true;
                      isSetting = false;
                      setTitle();
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 50),
                  leading: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 20,
                  ),
                  title: Text('Cài đặt',
                      style: TextStyle(color: Colors.white, fontSize: 17)),
                  onTap: () {
                    setState(() {
                      isGhepTro = false;
                      isThueTro = false;
                      isSetting = true;
                      setTitle();
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(left: 50, bottom: 50),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.arrow_forward,
                    color: _colorOrange,
                    size: 17,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 5),
                      child: GestureDetector(
                        onTap: () async {
                          widget.baseAuth.signOut().then((onValue) =>
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SignInScreen())));
                        },
                        child: Text(
                          'Exit',
                          style: TextStyle(color: _colorOrange, fontSize: 17),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  User userCurrent;
  FirebaseUser firebaseUser;
  Future isSignedIn() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    firebaseUser = await _auth.currentUser();
    var document = Firestore.instance
        .collection('users')
        .document(firebaseUser.uid.toString());
    document.get().then((value) {
      userCurrent = User(
        avatar: value.data["avatar"],
        email: value.data["email"],
        userId: firebaseUser.uid,
        userName: value.data["userName"],
      );
    });
  }

  @override
  void initState() {
    isSignedIn().then((_) {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _colorApp,
        title: Text(title),
        centerTitle: true,
      ),
      drawer: _buildDrawer(context),
      body: Stack(
        children: <Widget>[
          isThueTro
              ? Container(
                  child: ThueTroScreen(
                  userCurrent: userCurrent,
                ))
              : isGhepTro
                  ? Container(
                      child: GhepTroScreen(
                      userCurrent: userCurrent,
                    ))
                  : SettingScreen(
                      userCurrent: userCurrent,
                    ),
          // color: Colors.white,

          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              color: Colors.blueGrey[50],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: IconButton(
                      iconSize: 27,
                      icon: Icon(
                        Icons.home,
                        color:
                            isThueTro ? _colorApp : _colorApp.withOpacity(0.3),
                      ),
                      onPressed: () {
                        setState(() {
                          isThueTro = true;
                          isGhepTro = false;
                          isSetting = false;
                          setTitle();
                        });
                      },
                    ),
                  ),
                  Container(
                    child: IconButton(
                      iconSize: 27,
                      icon: Icon(Icons.person_add,
                          color: isGhepTro
                              ? _colorApp
                              : _colorApp.withOpacity(0.3)),
                      onPressed: () {
                        setState(() {
                          isThueTro = false;
                          isGhepTro = true;
                          isSetting = false;
                          setTitle();
                        });
                      },
                    ),
                  ),
                  Container(
                    child: IconButton(
                      iconSize: 27,
                      icon: Icon(
                        Icons.settings,
                        color:
                            isSetting ? _colorApp : _colorApp.withOpacity(0.3),
                      ),
                      onPressed: () {
                        setState(() {
                          isThueTro = false;
                          isGhepTro = false;
                          isSetting = true;
                          setTitle();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
