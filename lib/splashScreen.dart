import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


import 'Login.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
  


    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child:Image.asset("assets/logo.png"),
        ),
      ));

  }
}

