import 'dart:convert';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:garbage/scanEntry.dart';
import 'package:garbage/taost.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'Login.dart';

class ManualShowUserDetails extends StatefulWidget {
  ManualShowUserDetails({required this.Id});
  final String Id;

  @override
  State<ManualShowUserDetails> createState() => _ManualShowUserDetailsState();
}

var data;

var username, wardno, propertyno, propertyTy;

class _ManualShowUserDetailsState extends State<ManualShowUserDetails> {


  Map<String, dynamic> datalist = Map();

  var index = 0;

  Future<void> AddCollection(
      String customerid,
      String collectorid,
      String date,
      String collected,
      String reason,
      ) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse('http://192.168.1.110:8000/addcollection'));
      print("collection value $collection");
      request.body = json.encode({
        "customerid": widget.Id,
        "collectorid": 1233,
        "date": "0000-00-00 00:00:00.000000",
        "collected": collection,
        "reason": option,
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());

        // Data= datalist[0]['username'];
        //datalist= await response.stream.toString() as List;
        // print(await response.stream.bytesToString());
        //print(data);

      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  String stringdata = '';
  Future<void> QRCode(
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

  // Future apicall(
  //     String id
  //     )async{
  //   http.Response response;
  //   print("+++++++++++++++++++++++++++++++++++$id");
  //   var headers = {'Content-Type': 'application/json'};
  //   response = await http.post(Uri.parse('http://192.168.0.113:8000/getcustomerdetails'),body: {
  //     "id":id
  //   });
  //   response.headers.addAll(headers);
  //
  //   if(response.statusCode==200){
  //     setState(() {
  //       data = response.body;
  //     });
  //     print(data);
  //   }
  // }

//   Future<String?> QRCode(
//     String id,
//   ) async {
//     try {
//       http.Response response;
//       print("+++++++++++++++++++++++++++++++++++$id");
//       var headers = {'Content-Type': 'application/json'};
//       response = await http.post(
//           Uri.parse('http://192.168.0.113:8000/getcustomerdetails'),
//           body: {
//             "id": id,
//           });
//
//       // request.headers.addAll(headers);
//       //
//       // http.StreamedResponse response = await request.send();
//
//       if (response.statusCode == 200) {
//         setState(() {
//          datalist = json.decode(response.body);
//         });
//
//        // data = await response.stream.bytesToString();
//         //  //var responsebody = await data[3];
//         //  var responseJson = json.decode(request.body);
//         //   print(data);
//         //    var pdfText= await json.decode(json.encode(request.body));
//         //    print("data $pdfText");
//         // data = await response.stream.bytesToString();
//         // username=await responseJson['username'];
//
//         // setState(() {
//         //   print("UI updated");
//         // });
// //print(responseJson);
//
//         print(datalist);
//       } else {
//         print(response.reasonPhrase);
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }

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
    QRCode(widget.Id);
    setState(() {
      //   Data= datalist[0]['username'];

      QRCode(widget.Id);
    });

    WidgetsBinding.instance
        .addPostFrameCallback((timeStamp) => QRCode(widget.Id));
    // QRCode(_id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(datalist.isEmpty)...[
              Center(child: LoadingAnimationWidget.discreteCircle(color: Color(0xff074d58), size: 150))
            ]else if(datalist['Status']==false)...[
              Center(
                child: AlertDialog(
                    title: const Text("Alert Box!"),
                    content: const Text("Id not found"),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScanEntry()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff074d58)),
                            padding: const EdgeInsets.all(14),
                            child: const Text(
                              "OK",
                              style: TextStyle(color: Colors.white),
                            ),
                          ))
                    ]),
              )
            ]else...[
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),

                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        color: Colors.green.shade100,
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (datalist != null &&
                                  datalist.length > index) ...[
                                Text(
                                  "Name : " + datalist['rows'][index]['username'],
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Ward Number : " +
                                      datalist['rows'][index]['ward_no'].toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Property Number : " +
                                      datalist['rows'][index]['property_no'].toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Property Type : " +
                                      datalist['rows'][index]['property_type']
                                          .toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),

                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 60,),

                    // stringdata != null ? Text('${stringdata}') : Text("Loading ..."),

                    //datalist == null ? Text("") : Text(datalist[datalist.length>index]['username'].toString()),
                    // Text()
                    //   data.toString(),
                    //   style: TextStyle(
                    //     fontSize: 25,
                    //   ),
                    // ),

                    RadioListTile(
                      title: Text("Colledted"),
                      value: "1",
                      groupValue: collection,
                      onChanged: (value) {
                        setState(() {
                          collection = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Not Collected"),
                      value: "0",
                      groupValue: collection,
                      onChanged: (value) {
                        setState(() {
                          collection = value.toString();
                        });
                      },
                    ),
                    if (collection == "0") ...[
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
                          onChanged: (String? value) {
                            option = value!;
// This is called when the user selects an item.
                            setState(() {
                              option;
                            });
                          },
                          value: option,
                          items: OptionList.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                );
                              }).toList(),
                        ),
                      )
                    ],
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xff042A2F),
                                Color(0xFF06A77D),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {
                              Center(child: LoadingAnimationWidget.discreteCircle(color: Color(0xff074d58), size: 150));
                              var Collection = collection.toString();
                              if (Collection == '') {
                                var snackBar = SnackBar(
                                    content: Text('Please select option'));

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ScanEntry()),
                                );
                              //  _showToast("Details submitted successfully");
                              }

                              print(collection);
                              //print(collection);
                              //QRCode(widget.Id.toString());
                              AddCollection(
                                  45.toString(),
                                  46.toString(),
                                  "0000-00-00 00:00:00.000000",
                                  collection.toString(),
                                  option.toString());
                            },
                            child: Text(
                              "submit",
                              style: TextStyle(fontSize: 18),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              )
            ]
          ],

        )


             );
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
