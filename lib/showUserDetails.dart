import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class ShowUserDetails extends StatefulWidget {
  ShowUserDetails({required this.id});
  final String id;

  @override
  State<ShowUserDetails> createState() => _ShowUserDetailsState();
}

var data;

var username, wardno, propertyno, propertyTy;

class _ShowUserDetailsState extends State<ShowUserDetails> {
  late Map mapResponse;
  List<dynamic> datalist = [];
  // Future<void> QRCode(
  //   String id,
  // ) async {
  //   try {
  //     var headers = {'Content-Type': 'application/json'};
  //     var request = http.Request(
  //         'POST', Uri.parse('http://192.168.1.103:8000/getcustomerdetails'));
  //     request.body = json.encode({"id": id});
  //     request.headers.addAll(headers);
  //
  //     http.StreamedResponse response = await request.send();
  //
  //     if (response.statusCode == 200) {
  //       //datalist= await response.stream.toString() as List;
  //       print(await response.stream.bytesToString());
  //     //  print(datalist);
  //     } else {
  //       print(response.reasonPhrase);
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  Future<String?> QRCode(
    String id,
  ) async {
    try {
      http.Response response;
      print("+++++++++++++++++++++++++++++++++++$id");
      var headers = {'Content-Type': 'application/json'};
      response = await http.post(
          Uri.parse('http://192.168.1.103:8000/getcustomerdetails'),
          body: {
            "id": id,
          });

      // request.headers.addAll(headers);
      //
      // http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        setState(() {
         datalist = json.decode(response.body);
        });

       // data = await response.stream.bytesToString();
        //  //var responsebody = await data[3];
        //  var responseJson = json.decode(request.body);
        //   print(data);
        //    var pdfText= await json.decode(json.encode(request.body));
        //    print("data $pdfText");
        // data = await response.stream.bytesToString();
        // username=await responseJson['username'];

        // setState(() {
        //   print("UI updated");
        // });
//print(responseJson);

        print(datalist);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  List<String> OptionList = [
    "कचरा पृथक पृथक नहीं किया गया",
    "इंतज़ार करने के पश्चात भी कचरा नहीं दिया गया",
    "अनावश्यक विलंब किया गया",
    "गाड़ी ख़राब होने के कारण विलंब हुआ",
    "अनुचित व्यव्हार किया गया",
    "अन्य"
  ];

  String? collection;

  var isvisible;
  var option;
  @override
  void initState() {
    super.initState();
    QRCode(widget.id);
    setState(() {
      QRCode(widget.id);
    });

    WidgetsBinding.instance
        .addPostFrameCallback((timeStamp) => QRCode(widget.id!));
    // QRCode(_id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              datalist.toString(),
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Divider(),
            RadioListTile(
              title: Text("Colledted"),
              value: "Collected",
              groupValue: collection,
              onChanged: (value) {
                setState(() {
                  collection = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text("Not Collected"),
              value: "Not Collected",
              groupValue: collection,
              onChanged: (value) {
                setState(() {
                  collection = value.toString();
                });
              },
            ),
            if (collection == "Not Collected") ...[
              Container(
                margin: EdgeInsets.all(20),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Reason",
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
                  style: const TextStyle(color: Colors.blueAccent),
                  onChanged: (String? value) {
                    option = value!;
// This is called when the user selects an item.
                    setState(() {
                      option;
                    });
                  },
                  value: option,
                  items:
                      OptionList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              )
            ],
            ElevatedButton(
                onPressed: () {
                  print(collection);
                  QRCode(widget.id.toString());
                },
                child: Text("submit")),
          ],
        ),
      ),
    ));
  }
}
