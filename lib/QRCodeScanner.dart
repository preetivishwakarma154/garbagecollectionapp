import 'dart:convert';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:garbage/showUserDetails.dart';
import 'package:garbage/taost.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:garbage/Registration.dart';

import 'HomeScreen.dart';


class QRCodeScanner extends StatefulWidget {
  @override
  _QRCodeScannerState createState() => _QRCodeScannerState();
}

class _QRCodeScannerState extends State<QRCodeScanner> {

  List<dynamic> datalist = [];
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


  String _id = 'Scan a QR/Bar code';
  var  snackBar = SnackBar(
  content: Text(
  'ID not found'));
  String? collection;
  bool camState = false;



  qrCallback(String? code) {
    setState(() {
      camState = false;
      _id = code!;
    });
  }
  
  void Navigate(){
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => HomeScreen()),
    );
  }
// @override
//   void didChangeDependencies() {
//     QRCode(_id!);
//     super.didChangeDependencies();
//   }

  @override
  void initState() {
    super.initState();
   // WidgetsBinding.instance.addPostFrameCallback((timeStamp) => QRCode(_id!));
    // QRCode(_id!);
    setState(() {
      camState = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        // floatingActionButton: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     FloatingActionButton(
        //       onPressed: () {
        //         if (camState == true) {
        //           setState(() {
        //             camState = false;
        //           });
        //         } else {
        //           setState(() {
        //             camState = true;
        //           });
        //         }
        //       },
        //       child: Icon(Icons.camera),
        //     ),
        //   ],
        // ),
        body: camState
            ? Center(
          child: SizedBox(
            height: double.infinity,
            child: QRBarScannerCamera(
              onError: (context, error) =>
                  Text(
                    error.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
                  ),
              qrCodeCallback: (code) {
                qrCallback(code);
              },
              child: Text(""),
            ),
          ),
        )


    :Navigator(initialRoute: '/',onGenerateRoute: (RouteSettings setting){
          switch(setting.name){
            case '/':return MaterialPageRoute(builder: (context)=>ShowUserDetails(Id: _id.toString(),));
          }
        },
        ));
//           : Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Text(
//                   //   "Code :" + _qrInfo!,
//                   //   style: TextStyle(
//                   //     fontSize: 25,
//                   //   ),
//                   // ),
//                   // Divider(),
//                   _id!=""?QRCode(_id!):Text(("")),
//
//                   RadioListTile(
//                     title: Text("Colledted"),
//                     value: "Collected",
//                     groupValue: collection,
//                     onChanged: (value) {
//                       setState(() {
//                         collection = value.toString();
//                       });
//                     },
//                   ),
//                   RadioListTile(
//                     title: Text("Not Collected"),
//                     value: "Not Collected",
//                     groupValue: collection,
//                     onChanged: (value) {
//                       setState(() {
//                         collection = value.toString();
//                       });
//                     },
//                   ),
//                   if (collection == "Not Collected") ...[
//                     Container(
//                       margin: EdgeInsets.all(20),
//                       child: DropdownButtonFormField<String>(
//                         decoration: InputDecoration(
//                           labelText: "Reason",
//                           border: OutlineInputBorder(
//                             borderRadius: const BorderRadius.all(
//                               const Radius.circular(10.0),
//                             ),
//                           ),
//                           filled: true,
//                           hintStyle: TextStyle(color: Colors.grey[800]),
//                         ),
//                         icon: const Icon(Icons.arrow_drop_down_sharp),
//                         hint: Text("Select Option"),
//                         elevation: 16,
//                         isExpanded: true,
//                         style: const TextStyle(color: Colors.blueAccent),
//                         onChanged: (String? value) {
//                           option = value!;
// // This is called when the user selects an item.
//                           setState(() {
//                             option;
//                           });
//                         },
//                         value: option,
//                         items: OptionList.map<DropdownMenuItem<String>>(
//                             (String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(value),
//                           );
//                         }).toList(),
//                       ),
//                     )
//                   ],
//
//                   ElevatedButton(
//                       onPressed: () {
//                         print(collection);
//                         QRCode(_id.toString());
//                       },
//                       child: Text("submit")),
//                 ],
//               ),
  }}
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