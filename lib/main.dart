import 'package:flutter/material.dart';
import 'package:garbage/splashScreen.dart';


import 'Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Jabalpur Garabge Collection App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
    );
  }
}

