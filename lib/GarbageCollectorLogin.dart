import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Complaints.dart';
import 'GenerateQRCode.dart';
import 'Login.dart';
import 'Suggestions.dart';

class GarbageCollectorLogin extends StatefulWidget {
  const GarbageCollectorLogin({Key? key}) : super(key: key);

  @override
  State<GarbageCollectorLogin> createState() => _GarbageCollectorLoginState();
}

class _GarbageCollectorLoginState extends State<GarbageCollectorLogin> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Garbage Collection App"),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
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
                Icons.train,
              ),
              title: const Text('Page 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(5, 15, 5, 40),
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                Color(0xff5e7ec7),
                Color(0xFF82c4f0),
              ])),
              child: Text(
                "Customer Details",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GenerarteQRCode(
                              Identity: '',
                            )),
                  );
                },
                child: Text(
                  "View QR Code",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Suggestion()),
                  );
                },
                child: Text("Suggestion ", style: TextStyle(fontSize: 16)),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Complaints()),
                  );
                },
                child: Text("Complaints ", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
