import 'package:flutter/material.dart';
import 'package:garbage/scanEntry.dart';

import 'GarbageCollectorLogin.dart';
import 'HomePage.dart';
import 'HomeScreen.dart';
import 'Registration.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String password;
  TextEditingController _userController = TextEditingController();
  TextEditingController _passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Costumer Login"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                Color(0xff5e7ec7),
                Color(0xFF82c4f0),
              ])),
              child: Text(
                "User Login",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 18),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: _userController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color(0xff5e7ec7), width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2)),
                          hintText: 'Enter your full name',
                          labelText: 'Name',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: _passWordController,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(0xff5e7ec7), width: 2)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2)),
                            labelText: 'password'),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty && value.length < 7) {
                            return 'Invalid password!';
                          }
                        },
                        onFieldSubmitted: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10),
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        onPressed: () {
                          String _userName = _userController.text.toString();
                          String _password =
                              _passWordController.text.toString();
                          if (_userName == "bo" && _password == "bo") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          }
                          if (_userName == "ss" && _password == "ss") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      GarbageCollectorLogin()),
                            );
                          }
                          if (_userName == "gc" && _password == "gc") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScanEntry()),
                            );
                          }
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                        child: Text(
                          "New User? Register",
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
