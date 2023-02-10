import 'dart:async';
import 'dart:convert';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:garbage/scanEntry.dart';
import 'package:garbage/taost.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'GarbageCollectorLogin.dart';

import 'HomeScreen.dart';
import 'Registration.dart';
import 'inputBox.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late String password;
  TextEditingController _userController = TextEditingController();
  TextEditingController _passWordController = TextEditingController();
  Map dataList = Map();
  var data;

  Future<void> userIdPost(
    String username,
    String password,
  ) async {
    try {
      print("Hello");
      var headers = {'Content-Type': 'application/json'};
      var request =
          http.Request('POST', Uri.parse('http://192.168.1.110:8000/auth'));
      request.body = json.encode({
        "username": username,
        "password": password,
      });
      request.headers.addAll(headers);
      await Future.delayed(Duration(milliseconds: 1500));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        data = await response.stream.bytesToString();
        setState(() {
          dataList = json.decode(data);
        });

        if (dataList['status'] == true) {
       //   _showToast("Login Successfully");
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    GarbageCollectorLogin(dataList['results'])),
          );
        }


        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
   // fToast = FToast();
  //  fToast.init(context);
    // Timer(Duration(seconds: 3), () {
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>FlutterToast()));
    // });
    //  userIdPost(_userController.toString(), _passWordController.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Customer Login"),
      ),
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.white,
              Color(0xff074d58),
            ])),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Center(
                    child: SingleChildScrollView(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Container(
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(15),
                            //     color: Colors.white,
                            //   ),
                            //   margin: EdgeInsets.fromLTRB(5, 15, 5, 40),
                            //   alignment: Alignment.topCenter,
                            //   padding: EdgeInsets.all(10),
                            //
                            //
                            //   // decoration: BoxDecoration(
                            //   //     gradient: LinearGradient(colors: <Color>[
                            //   //   Color(0xff339300),
                            //   //   Color(0xff1b890d),
                            //   // ])),
                            //
                            // ),

                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                "Welcome",
                                style: TextStyle(
                                    color: Color(0xff074d58),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "AkayaTelivigala",
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Color.fromARGB(33, 225, 27, 3),
                                            blurRadius: 20,
                                            offset: Offset(0, 10))
                                      ]),
                                  child: Column(
                                    children: [
                                      InputBox(
                                        controller: _userController,
                                        inputType: TextInputType.name,
                                        lableText: 'Name',
                                        hintText: 'username',
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        child: TextFormField(
                                          controller: _passWordController,
                                          decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Color(0xff042A2B),
                                                      width: 2)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Colors.grey,
                                                      width: 2)),
                                              labelText: ''
                                                  'Password'),
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          obscureText: true,
                                          validator: (value) {
                                            if (value!.isEmpty &&
                                                value.length < 7) {
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
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Container(
                                        height: 45,
                                        width: double.infinity,
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: <Color>[
                                                Color(0xff042A2F),
                                                Color(0xFF06A77D),
                                              ],
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.all(10),
                                              backgroundColor: Colors
                                                  .transparent,
                                              shadowColor: Colors.transparent,

                                              //backgroundColor: Color(0xff042A2F),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10)))),
                                          onPressed: () {
                                            String _userName =
                                                _userController.text.toString();
                                            String _password =
                                                _passWordController.text
                                                    .toString();

                                            if (_userName.isEmpty ||
                                                _password.isEmpty) {

                                              var snackBar = SnackBar(
                                                  content: Text(
                                                      'Please enter the Username or Password'));

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            } else if (_userName == "bo" &&
                                                _password == "bo") {
                                            //  _showToast("Login Successfully");
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeScreen()),
                                              );
                                            } else if (_userName == "gc" &&
                                                _password == "gc") {
                                            //  _showToast("Login Successfully");
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>

                                                      ScanEntry()
                                                ),
                                              );
                                            } else if (data ==
                                                "Incorrect Username and/or Password!") {
                                              var snackBar = SnackBar(
                                                  content: Text(
                                                      'Invalid Username or Password'));
                                              // Step 3
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            } else
                                              Center(child: LoadingAnimationWidget.discreteCircle(color: Color(0xff074d58), size: 150));
                                              userIdPost(
                                                  _userController.text
                                                      .toString(),
                                                  _passWordController.text
                                                      .toString());
                                          },
                                          child: Text(
                                            "Login",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      TextButton(

                                          onPressed: () {
                                            Center(child: LoadingAnimationWidget.discreteCircle(color: Color(0xff074d58), size: 150));
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Register()),
                                            );
                                          },
                                          child: Text(
                                            "New User? Register",
                                          )),
                                    ],
                                  ),
                                ),

                                // Step 2

                                // Text(
                                //   dataList['id'].toString(),
                                // )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
// _showToast(String text) {
//   Widget toast = Container(
//     padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(25.0),
//       color: Color(0xFFfed502),
//     ),
//     child: Row(
//
//       children: [
//         Icon(Icons.check),
//         SizedBox(
//           width: 12.0,
//         ),
//         Text(text),
//       ],
//     ),
//   );
//
//
//   fToast.showToast(
//     child: toast,
//     gravity: ToastGravity.BOTTOM_RIGHT,
//     toastDuration: Duration(milliseconds: 1500),
//   );
//
//   // Custom Toast Position
//   // fToast.showToast(
//   //     child: toast,
//   //     toastDuration: Duration(seconds: 1),
//   //     positionedToastBuilder: (context, child) {
//   //       return Positioned(
//   //         child: child,
//   //         top: 136.0,
//   //         left: 116.0,
//   //       );
//   //     });
// }