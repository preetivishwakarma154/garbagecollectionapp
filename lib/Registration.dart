import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'GenerateQRCode.dart';
import '';

import 'Login.dart';
import 'inputBox.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //
  // Future<void> register (String qrcode, String parcelno,String username,String
  // fathername,String identityno,String mobileno, String wardno,String propertyno,String propertytype
  //     , String noofmembers,String propertytaxno,String watertaxno, String electricityconnectionno,
  //     String paidpropertytax,String buildingpermission)async {
  //   var url = Uri.parse('http://localhost:8000/createcustomer');
  //
  //   var headers = {
  //     'Content-Type': 'application/json'
  //   };
  //   var response = await http.post(url, headers: headers, body: jsonEncode({
  //     "qrcode": qrcode,
  //           "parcelno": parcelno,
  //           "username": username,
  //           "fathername": fathername,
  //           "identityno": identityno,
  //           "mobileno": mobileno,
  //           "wardno": wardno,
  //           "propertyno": propertyno,
  //           "propertytype": propertytype,
  //           "noofmembers": noofmembers,
  //           "propertytaxno": propertytaxno,
  //           "watertaxno": watertaxno,
  //           "electricityconnectionno":electricityconnectionno,
  //           "paidpropertytax": paidpropertytax,
  //           "buildingpermission": buildingpermission
  //
  //
  //   }));
  //   if (response.statusCode == 200) {
  //     print("success");
  //   } else {
  //     print("failed");
  //   }
  // }
  Future<void> Registertration(
      String qrcode, String parcelno, String fathername, String warno) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse('http://192.168.0.105:8000/createcustomerr'));
      request.body = json.encode(
          {"qrcode": 4444, "parcelno": 6666, "fathername": "id", "warno": 699});
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

  Future<void> register(
      String qrcode,
      String parcelno,
      String username,
      String fathername,
      String identityno,
      String mobileno,
      String wardno,
      String propertyno,
      String propertytype,
      String noofmembers,
      String propertytaxno,
      String watertaxno,
      String electricityconnectionno,
      String paidpropertytax,
      String buildingpermission) async {
    try {
      print("$qrcode");

      var headers = {'Content-Type': 'application/json'};

      var request = http.Request(
          'POST', Uri.parse('http://192.168.0.105:8000/createcustomer'));
      print(request);
      var JSon = request.body = json.encode({
        "qrcode": qrcode,
        "parcelno": parcelno,
        "username": username,
        "fathername": fathername,
        "identityno": identityno,
        "mobileno": mobileno,
        "wardno": wardno,
        "propertyno": propertyno,
        "propertytype": propertytype,
        "noofmembers": noofmembers,
        "propertytaxno": propertytaxno,
        "watertaxno": wardno,
        "electricityconnectionno": electricityconnectionno,
        "paidpropertytax": paidpropertytax,
      });
      print("Json data $JSon");
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      print(response);

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> Get_data() async {
    final response =
        await http.get(Uri.parse("http://192.168.0.105:8000/garbagecollector"));
    var data = jsonDecode(response.body.toString());
    print("response $data");
    if (response.statusCode == 200) {
      return print("connect");
    } else {
      return print("failed");
    }
  }

  // PostData()async{
  //   var response = http.post(
  //     Uri.parse('http://localhost:8000/createcustomer'),
  //     body: {
  //              "qrcode":1.toString(),
  //             "parcelno": 1.toString(),
  //             "username": "username",
  //             "fathername": "fathername",
  //             "identityno": 1.toString(),
  //             "mobileno": 1.toString(),
  //             "wardno": 1.toString(),
  //             "propertyno": 1.toString(),
  //             "propertytype": "propertytype",
  //             "noofmembers": 1.toString(),
  //             "propertytaxno": 1.toString(),
  //             "watertaxno": 1.toString(),
  //             "electricityconnectionno":1.toString(),
  //             "paidpropertytax": 1.toString(),
  //             "buildingpermission": 1.toString(),
  //     }
  //   );
  //   print(response);
  // }
  @override
  Widget build(BuildContext context) {
    List<String> WardList = <String>[
      'Select Ward No',
      'One',
      'Two',
      'Three',
      'Four'
    ];
    List<String> PropertyList = <String>[
      'Select Property type',
      'Residential',
      'Commerical',
      'Mix',
      'Industrial',
      'Trust',
      'Lease',
      'Government',
      'Temporaty'
    ];
    List<String> BuildingPermission = <String>["Yes", "No"];

    String wardDropdownValue = WardList.first;
    String BulidingpermissionValue = BuildingPermission.first;
    String propertyDropdownValue = PropertyList.first;
    TextEditingController qrcode = TextEditingController();
    TextEditingController parcelno = TextEditingController();
    TextEditingController username = TextEditingController();
    TextEditingController fathername = TextEditingController();

    TextEditingController mobileno = TextEditingController();
    TextEditingController propertyno = TextEditingController();
    TextEditingController noofmembers = TextEditingController();
    TextEditingController propertytaxno = TextEditingController();
    TextEditingController watertaxno = TextEditingController();
    TextEditingController electricityconnectionno = TextEditingController();
    TextEditingController identity = TextEditingController();
    TextEditingController paidpropertytax = TextEditingController();

    late String password;
    return Scaffold(
      appBar: AppBar(
        title: Text("Costumer Registration"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
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
                "Customer Registration",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 18),
              ),
            ),
            InputBox(
                controller: qrcode,
                inputType: TextInputType.number,
                lableText: 'QRCode'),
            InputBox(
                controller: parcelno,
                inputType: TextInputType.number,
                lableText: 'Parcel No'),
            InputBox(
                controller: username,
                inputType: TextInputType.text,
                lableText: 'Applicant Name'),
            InputBox(
                controller: fathername,
                inputType: TextInputType.text,
                lableText: "Father'\s  Name "),
            InputBox(
                controller: identity,
                inputType: TextInputType.number,
                lableText: 'Enter Aadhar Card No'),
            InputBox(
                controller: mobileno,
                inputType: TextInputType.phone,
                lableText: 'Mobile No'),
            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Ward number",
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                ),
                value: wardDropdownValue,
                icon: const Icon(Icons.arrow_drop_down_outlined),
                elevation: 16,
                style: const TextStyle(color: Colors.blueAccent),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    wardDropdownValue = value!;
                  });
                },
                items: WardList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            InputBox(
                controller: propertyno,
                inputType: TextInputType.number,
                lableText: 'Unique No of Property'),
            InputBox(
                controller: noofmembers,
                inputType: TextInputType.number,
                lableText: 'Number of Member'),
            InputBox(
                controller: propertytaxno,
                inputType: TextInputType.number,
                lableText: 'Property Tax No'),
            InputBox(
                controller: watertaxno,
                inputType: TextInputType.number,
                lableText: 'Water Tax No'),
            InputBox(
                controller: electricityconnectionno,
                inputType: TextInputType.number,
                lableText: 'Electricity Bill No'),
            InputBox(
                controller: paidpropertytax,
                inputType: TextInputType.number,
                lableText: ' Paid Property Tax'),
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
                icon: const Icon(Icons.arrow_drop_down_outlined),
                elevation: 16,
                style: const TextStyle(color: Colors.blueAccent),
                onChanged: (String? value) {
                  setState(() {
                    BulidingpermissionValue = value!;
                  });
                  // This is called when the user selects an item.
                },
                value: BulidingpermissionValue,
                items: BuildingPermission.map<DropdownMenuItem<String>>(
                    (String value) {
                  return DropdownMenuItem<String>(
                      value: value, child: Text(value));
                }).toList(),
              ),
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
                  Registertration(
                      qrcode.text.toString(),
                      parcelno.text.toString(),
                      fathername.text.toString(),
                      identity.text.toString());
                  String qrCode = qrcode.text.toString();
                  var parcelNo = parcelno.text.toString();
                  var userName = username.text.toString();
                  var fatherName = fathername.text.toString();
                  var Identity = identity.text.toString();
                  var mobileNo = mobileno.text.toString();
                  var WardDropdownValue = wardDropdownValue.toString();
                  var propertyNo = propertyno.text.toString();
                  var PropertyDropdownValue = propertyDropdownValue.toString();
                  var Noofmembers = noofmembers.text.toString();
                  var Propertytaxno = propertytaxno.text.toString();
                  var Watertaxno = watertaxno.text.toString();
                  var electricityConnectionno =
                      electricityconnectionno.text.toString();
                  var paidPropertytax = paidpropertytax.text.toString();
                  var BulidingPermissionValue =
                      BulidingpermissionValue.toString();
                  print("$qrCode,$parcelNo,$userName,$fatherName,$Identity,"
                      "$mobileNo,$WardDropdownValue,$propertyNo,$PropertyDropdownValue,$Noofmembers,"
                      "$Propertytaxno,$Watertaxno,$electricityConnectionno,$BulidingPermissionValue");
                  Get_data();

                  register(
                      qrcode.text.toString(),
                      parcelno.text.toString(),
                      username.text.toString(),
                      fathername.text.toString(),
                      identity.text.toString(),
                      mobileno.text.toString(),
                      wardDropdownValue.toString(),
                      propertyno.text.toString(),
                      propertyDropdownValue.toString(),
                      noofmembers.text.toString(),
                      propertytaxno.text.toString(),
                      watertaxno.text.toString(),
                      electricityconnectionno.text.toString(),
                      paidpropertytax.text.toString(),
                      BulidingpermissionValue.toString());
                },
                child: Text(
                  "Register",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 18),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: Text("New User? Login"))
          ],
        ),
      )),
    );
  }
}
