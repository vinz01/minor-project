import 'dart:async';
import 'package:flutter/material.dart';
import './loginScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }
  
  void navigationPage() {
    Navigator
    .of(context)
    .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Image.asset('images/logo_black.png'),
      ),
    );
  }
}