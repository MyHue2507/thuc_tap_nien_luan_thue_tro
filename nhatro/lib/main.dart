import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nhatro/services/call.dart';
import 'package:nhatro/services/service.dart';
import 'package:nhatro/splash_screen.dart';


void main() {
  setupLocator();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}
void setupLocator() {
  locator.registerSingleton(CallsAndMessagesService());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
