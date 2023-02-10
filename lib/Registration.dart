import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
          'POST', Uri.parse('http://192.168.0.104:8000/createcustomerr'));
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
      String password,
      String father_name,
      String identity_no,
      String mobile_no,
      String ward_no,
      String property_no,
      String property_type,
      String no_of_members,
      String property_tax_no,
      String water_tax_no,
      String electricity_connection,
      String paid_property_tax,
      String building_permission) async {
    try {


      var headers = {'Content-Type': 'application/json'};

      var request = http.Request(
          'POST', Uri.parse('http:/192.168.1.110:8000/createcustomer'));
      print(request);
      var JSon = request.body = json.encode({
        "qrcode": qrcode,
        "parcelno": parcelno,
        "username": username,
        "password":password,
        "father_name": father_name,
        "identity_no": identity_no,
        "mobile_no": mobile_no,
        "ward_no": ward_no,
        "property_no": property_no,
        "property_type": property_type,
        "no_of_members": no_of_members,
        "property_tax_no": property_tax_no,
        "water_tax_no": water_tax_no,
        "electricity_connection": electricity_connection,
        "paid_property_tax": paid_property_tax,
        "building_permission":building_permission
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
        await http.get(Uri.parse("http:/192.168.1.110:8000/garbagecollector"));
    var data = jsonDecode(response.body.toString());
    await Future.delayed(Duration(milliseconds: 1500));
    print("response $data");
    if (response.statusCode == 200) {
      return print("connect");
    } else {
      return print("failed");
    }
  }
  var wardDropdownValue ;
  var BulidingpermissionValue;
  var propertyDropdownValue ;

  List<String> WardList = <String>[

    '1',
    '2',
    '3',
    '4','5','6'
  ];
  List<String> PropertyList = <String>[

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



    TextEditingController qrcode = TextEditingController();
    TextEditingController parcelno = TextEditingController();
    TextEditingController username = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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
            // Container(
            //   margin: EdgeInsets.fromLTRB(5, 15, 5, 40),
            //   alignment: Alignment.topCenter,
            //   padding: EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //       gradient: LinearGradient(colors: <Color>[
            //     Color(0xff5e7ec7),
            //     Color(0xFF82c4f0),
            //   ])),
            //   child: Text(
            //     "Customer Registration",
            //     style: TextStyle(
            //         fontWeight: FontWeight.w700,
            //         color: Colors.white,
            //         fontSize: 18),
            //   ),
            // ),
            SizedBox(height: 20,),
            InputBox(
                controller: qrcode,
                inputType: TextInputType.number,
                lableText: 'QRCode', hintText: '',),
            InputBox(
                controller: parcelno,
                inputType: TextInputType.number,
                lableText: 'Parcel No', hintText: '',),
            InputBox(
                controller: username,
                inputType: TextInputType.name,
                lableText: 'Username', hintText: 'Enter Username',),
            InputBox(
                controller: passwordController,
                inputType: TextInputType.visiblePassword,
                lableText: 'Password', hintText: 'Enter Password',),

            InputBox(
                controller: fathername,
                inputType: TextInputType.name,
                lableText: "Father'\s  Name ", hintText: '',),
            InputBox(
                controller: identity,
                inputType: TextInputType.number,
                lableText: 'Enter Aadhar Card No', hintText: '',),
            InputBox(
                controller: mobileno,
                inputType: TextInputType.phone,
                lableText: 'Mobile No', hintText: '',),
            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Ward Number",
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                ),
                icon: const Icon(Icons.arrow_drop_down_outlined),
                hint: Text("Select Option"),
                elevation: 16,
                isExpanded: true,
                style: const TextStyle(color: Colors.black),
                onChanged: (String? value) {
                  wardDropdownValue = value!;
                  // This is called when the user selects an item.

                },
                value: wardDropdownValue,
                items: WardList.map<DropdownMenuItem<String>>(
                        (String value) {
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
                lableText: 'Unique No of Property', hintText: '',),
            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Property Type",
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                ),
                icon: const Icon(Icons.arrow_drop_down_outlined),
                hint: Text("Select Option"),
                elevation: 16,
                isExpanded: true,
                style: const TextStyle(color: Colors.black),
                onChanged: (String? value) {
                  propertyDropdownValue = value!;
                  // This is called when the user selects an item.

                },
                value: propertyDropdownValue,
                items:PropertyList.map<DropdownMenuItem<String>>(
                        (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
              ),
            ),
            InputBox(
                controller: noofmembers,
                inputType: TextInputType.number,
                lableText: 'Number of Member', hintText: '',),
            InputBox(
                controller: propertytaxno,
                inputType: TextInputType.number,
                lableText: 'Property Tax No', hintText: '',),
            InputBox(
                controller: watertaxno,
                inputType: TextInputType.number,
                lableText: 'Water Tax No', hintText: '',),
            InputBox(
                controller: electricityconnectionno,
                inputType: TextInputType.number,
                lableText: 'Electricity Bill No', hintText: '',),
            InputBox(
                controller: paidpropertytax,
                inputType: TextInputType.number,
                lableText: ' Paid Property Tax', hintText: '',),
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
                style: const TextStyle(color: Colors.black),
                onChanged: (String? value) {

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

              height: 45,
              width: double.infinity,

              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xff042A2F),
                      Color(0xFF06A77D),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15)

              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
                onPressed: () {
                  Center(child: LoadingAnimationWidget.discreteCircle(color: Color(0xff074d58), size: 150));

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
                      "$mobileNo,$WardDropdownValue,$propertyNo,$PropertyDropdownValue,$Noofmembers,$paidPropertytax"
                      "$Propertytaxno,$Watertaxno,$electricityConnectionno,$BulidingPermissionValue");
                  Get_data();

                  register(
                      qrcode.text.toString(),
                      parcelno.text.toString(),
                      username.text.toString(),
                      passwordController.text.toString(),
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
                  Center(child: LoadingAnimationWidget.discreteCircle(color: Color(0xff074d58), size: 150));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: Text("Already Registered? Login",style: TextStyle(
                  fontSize: 16
                ),)),
            SizedBox(
              height: 30,
            )
          ],
        ),
      )),
    );
  }
}
