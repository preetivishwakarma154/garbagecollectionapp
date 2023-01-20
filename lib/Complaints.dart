import 'dart:convert';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:garbage/DropDownMenu.dart';
import 'package:http/http.dart' as http;

import 'Login.dart';
import 'inputBox.dart';

class Complaints extends StatefulWidget {
  const Complaints({Key? key}) : super(key: key);

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
          'POST', Uri.parse('http://192.168.0.105:8000/createcomplaint'));
      request.body = json.encode({
        "complainttype": ComplaintType,
        "complaint": complaint,
        "customerid": id
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

  List<String> ComplaintTypeList = <String>[
    'Select Complaint Type',
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
                    labelText: "Building Permission",
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                  ),
                  icon: const Icon(Icons.arrow_downward),
                  hint: Text("Select Option"),
                  elevation: 16,
                  isExpanded: true,
                  style: const TextStyle(color: Colors.blueAccent),
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
              InputBox(
                controller: _complaintBoxController,
                inputType: TextInputType.text,
                lableText: 'Complaint Box',
              ),
              InputBox(
                controller: id,
                inputType: TextInputType.number,
                lableText: 'id',
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
                    complaint(
                        ComplaintType.toString(),
                        _complaintBoxController.text.toString(),
                        id.text.toString());

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
