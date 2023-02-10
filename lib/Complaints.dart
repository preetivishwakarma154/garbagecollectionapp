import 'dart:convert';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:garbage/DropDownMenu.dart';
import 'package:garbage/GarbageCollectorLogin.dart';
import 'package:garbage/taost.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'Login.dart';
import 'inputBox.dart';

class Complaints extends StatefulWidget {
  const Complaints({Key? key, required this.idd}) : super(key: key);
  final List idd;

  @override
  State<Complaints> createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  var ComplaintType;

  Future<void> complaint(
    String complainttype,
    String complaint,
    String id,
  ) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse('http://192.168.1.110:8000/createcomplaint'));
      request.body = json.encode({
        "complainttype": ComplaintType,
        "complaint": complaint,
        "customerid": id
      });
      request.headers.addAll(headers);
      await Future.delayed(Duration(milliseconds: 1500));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());

      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  List<String> ComplaintTypeList = <String>[

    'Not Collected',
    'MisBehaviour',
    'Other'
  ];
  TextEditingController _complaintBoxController = TextEditingController();
  TextEditingController id = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Complaints"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // DropDownMenu(lableText: "Sele Complaint Box", ListValue: ComplaintTypeList, DropDownValue: ComplaintType),
              Container(
                margin: EdgeInsets.all(10),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Complaint Type",
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                  ),
                  icon: const Icon(Icons.arrow_drop_down_sharp),
                  hint: Text("Select Option"),
                  elevation: 16,
                  isExpanded: true,

                  onChanged: (String? value) {
                    ComplaintType = value!;
                    // This is called when the user selects an item.
                    setState(() {
                      ComplaintType;
                    });
                  },
                  value: ComplaintType,
                  items: ComplaintTypeList.map<DropdownMenuItem<String>>(
                      (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
           
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  minLines: 1,
                  maxLines: 5,
                  controller: _complaintBoxController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                          BorderSide(color: Color(0xff042A2F), width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                      labelText: 'Complaint Box',

                  ),
                ),
              ),


              Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      backgroundColor:Color(0xFF03A077),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                  onPressed: () {
                    Center(child: LoadingAnimationWidget.discreteCircle(color: Color(0xff074d58), size: 150));
                    String AddConplaintType = ComplaintType.toString();
                    String Addcomplaint = _complaintBoxController.text.toString();
                    if(Addcomplaint.isEmpty || AddConplaintType.isEmpty){
                      var snackBar = SnackBar(
                          content: Text(
                              'Please enter the Complaint or Complaint Type'));

                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackBar);
                    }else{

                      complaint(
                          ComplaintType.toString(),
                          _complaintBoxController.text.toString(),
                          widget.idd[0]['id'].toString()


                      );


                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GarbageCollectorLogin(widget.idd)),
                      );
                    //  _showToast("Submitted Successfully");
                    }
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
//     gravity: ToastGravity.BOTTOM,
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