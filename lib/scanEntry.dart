import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:garbage/showUserDetails.dart';
import 'package:garbage/taost.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'Login.dart';
import 'QRCodeScanner.dart';
import 'ShowManualEntryDetails.dart';
import 'inputBox.dart';

class ScanEntry extends StatefulWidget {
  const ScanEntry({Key? key}) : super(key: key);

  @override
  State<ScanEntry> createState() => _ScanEntryState();
}
var data;

class _ScanEntryState extends State<ScanEntry> {
  TextEditingController ManualEntry = TextEditingController();
  Map<String,dynamic> datalist = Map();
  String stringdata = '';
  Future<void> CheckUserID(
    String id,
  ) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse('http://192.168.1.110:8000/getcustomerdetails'));
      request.body = json.encode({"id": id});
      request.headers.addAll(headers);
      await Future.delayed(Duration(milliseconds: 1500));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        data = await response.stream.bytesToString();
        setState(() {
          // stringdata = data;
          datalist = json.decode(data);
          // print(" user $datalist");
        });
        if (datalist['Status']==false) {
          var snackBar = SnackBar(content: Text('ID not found'));

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ManualShowUserDetails(Id:ManualEntry.text.toString() )),
          );
        }

        // Data= datalist[0]['username'];
        //datalist= await response.stream.toString() as List;
        // print(await response.stream.bytesToString());
        //print(data);
        print(datalist);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    //fToast = FToast();
    //fToast.init(context);
    // Timer(Duration(seconds: 3), () {
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>_showToast()));
    // });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> _tabBarView = [
      Column(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xff042A2F),
                    Color(0xFF06A77D),
                  ],
                ),
                borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.only(top: 30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
              onPressed: () {
                Center(child: LoadingAnimationWidget.discreteCircle(color: Color(0xff074d58), size: 150));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRCodeScanner()),
                );
              },
              child: Text(
                "Start Scanning",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            InputBox(
              controller: ManualEntry,
              inputType: TextInputType.text,
              lableText: 'Search by QR Id ',
              hintText: '',
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xff042A2F),
                      Color(0xFF06A77D),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15)),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
                onPressed: () {
                  var manualEntry = ManualEntry.text.toString();
                  CheckUserID(manualEntry);
                  if (manualEntry.isEmpty) {
                    var snackBar =
                        SnackBar(content: Text('Please enter the value'));

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else CheckUserID(manualEntry);


                },
                child: Text(
                  "Search",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ];
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            //  title: Text("Customer Registration"),
            bottom: TabBar(
              tabs: [
                Text(
                  "Scan QR Code",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Manual Entry",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
          drawer: Drawer(
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
          body: Center(
            child: TabBarView(
              children: _tabBarView,
            ),
          ),
        ));
  }
}

// _showToast(String text) {
//   Widget toast = Container(
//     padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(25.0),
//       color: Colors.green,
//     ),
//     child: Row(
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
//   fToast.showToast(
//     child: toast,
//     gravity: ToastGravity.BOTTOM,
//     toastDuration: Duration(seconds: 1),
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
