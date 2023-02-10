import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'Complaints.dart';
import 'GenerateQRCode.dart';
import 'Login.dart';
import 'Suggestions.dart';

class GarbageCollectorLogin extends StatefulWidget {
  GarbageCollectorLogin(this.id);
final List id;
  @override
  State<GarbageCollectorLogin> createState() => _GarbageCollectorLoginState();
}

class _GarbageCollectorLoginState extends State<GarbageCollectorLogin> {
  @override
  void initState() {
    print("init state"+widget.id.toString());
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Dashboard"),
      ),
      drawer:Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF06A77D),
                ),
                child: Image(
                    color: Colors.white,
                    image: AssetImage(
                      "assets/user.png",
                    ))),
            ListTile(
                leading: Icon(
                  Icons.logout,
                ),
                title: const Text('Logout'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                }),
            ListTile(
              leading: Icon(
                Icons.verified_user,
              ),
              title: const Text('user'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 50,),

            Container(
              height: 55,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF03A077),
                      Color(0xFF06A77D),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(5)

              ),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
                onPressed: () {
                  if(widget.id.isNotEmpty){
                    Center(child: LoadingAnimationWidget.discreteCircle(color: Color(0xff074d58), size: 150));
                    Navigator.push(
                      context,
                      MaterialPageRoute(

                          builder: (context) => GenerarteQRCode(

                            Identity: widget.id[0]['id'].toString(),
                          )),
                    );
                  }

                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [


                    Icon( // <-- Icon
                      Icons.qr_code,
                      size: 24.0,
                    ),
                  SizedBox(width: 15,),
                  Text(
                    "View QR Code",
                    style: TextStyle(fontSize: 20),
                  )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              decoration: BoxDecoration(
            gradient: LinearGradient(
            colors: <Color>[
              Color(0xFF03A077),
              Color(0xFF06A77D),
          ],
        ),
          borderRadius: BorderRadius.circular(5)

      ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Suggestion(idList:widget.id)),
                  );
                },
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [


                    Icon( // <-- Icon
                      Icons.receipt_long,
                      size: 24.0,
                    ),
                    SizedBox(width: 15,),
                    Text(
                      "Add Suggestion",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF03A077),
                      Color(0xFF06A77D),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(5)

              ),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Complaints(idd:widget.id,)),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [


                    Icon( // <-- Icon
                      Icons.description_outlined,
                      size: 24.0,
                    ),
                    SizedBox(width: 15,),
                    Text(
                      "Add Complaint",
                      style: TextStyle(fontSize: 20),
                    )
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
