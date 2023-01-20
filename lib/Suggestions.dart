import 'dart:convert';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:garbage/DropDownMenu.dart';
import 'package:http/http.dart' as http;

import 'Login.dart';
import 'inputBox.dart';

class Suggestion extends StatefulWidget {
  const Suggestion({Key? key}) : super(key: key);

  @override
  State<Suggestion> createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  var ComplaintType;

  Future<void> suggestion(
      String custid,
      String suggestion,

      ) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse('http://192.168.0.101:8000/addsuggestion'));
      request.body = json.encode({
        "custid": 420.toString(),
        "suggestion": _suggestion.text.toString(),

      });

      request.headers.addAll(headers);

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
            children: [


              InputBox(
                controller: _suggestion,
                inputType: TextInputType.text,
                lableText: 'Write your suggestion',
              ),



              Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                  onPressed: () {
                    suggestion(
                        "336",
                        _suggestion.text.toString()
                        );

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Login()),
                    // );
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
