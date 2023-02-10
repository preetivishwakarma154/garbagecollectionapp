import 'dart:convert';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:garbage/DropDownMenu.dart';
import 'package:garbage/taost.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'GarbageCollectorLogin.dart';
import 'Login.dart';
import 'inputBox.dart';

class Suggestion extends StatefulWidget {
  const Suggestion({Key? key, required this.idList}) : super(key: key);
  final List idList;

  @override
  State<Suggestion> createState() => _SuggestionState();
}

List dataList = [];

class _SuggestionState extends State<Suggestion> {
  Future getCollection() async {
    try {
      final response = await http
          .get(Uri.parse("http://192.168.1.110:8000/getcollecteddata"));
      //   dataList = await jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        print(dataList);
        setState(() {
          dataList = jsonDecode(response.body.toString());
        });

        print("collection $dataList");
        //// print(collecton);

        return dataList;
      } else {
        return response.reasonPhrase.toString();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  var ComplaintType;

  Future<void> suggestion(
    String custid,
    String suggestion,
  ) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse('http://192.168.1.110:8000/addsuggestion'));
      request.body = json.encode({
        "custid": widget.idList[0]['id'].toString(),
        "suggestion": _suggestion.text.toString(),
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

  TextEditingController _suggestion = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Suggestion"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  minLines: 1,
                  maxLines: 5,
                  controller: _suggestion,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color(0xff042A2F), width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                      labelText: 'Suggestion Box',
                      hintText: "Write your suggestion"),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      backgroundColor: Color(0xFF03A077),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                  onPressed: () {
                    String AddSuggestion = _suggestion.text.toString();
                    if(AddSuggestion.isEmpty){
                      var snackBar = SnackBar(
                          content: Text(
                              'Please enter the Suggestion'));

                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackBar);

                    }else{
                      Center(child: LoadingAnimationWidget.discreteCircle(color: Color(0xff074d58), size: 150));
                      suggestion(widget.idList[0]['id'].toString(), _suggestion.text.toString());
                     // _showToast("Submitted Successfully");

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                GarbageCollectorLogin(widget.idList)),
                      );
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
