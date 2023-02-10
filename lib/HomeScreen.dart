

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:garbage/Login.dart';
import 'package:garbage/http.dart';
import 'package:garbage/postApi.dart';
import 'package:garbage/practice.dart';
import 'package:garbage/showTable.dart';
import 'package:garbage/suggestionTable.dart';

import 'Collection.dart';
import 'CustomerDetails.dart';
import 'GarbageCollectorDetails.dart';
import 'Suggestion_Table.dart';
import 'button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  @override


  Widget build(BuildContext context) {
    return Scaffold(
        drawer:Drawer(
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
      appBar: AppBar(
        titleSpacing: 20,
        title: Text("Reports"),

      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [


            SizedBox(height: 30,),

            Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
              decoration: BoxDecoration(
                color:  Color(0xff054b54),
                borderRadius: BorderRadius.circular(15)
              ),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15),
                     backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      textStyle: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ShowTable(
                                "http://192.168.1.110:8000/getcollecteddata",
                                "Name",
                                "ProperTy Number",
                                "Ward NO",
                                "Date",
                                "Collected",
                                'username',
                                'property_no',
                                'ward_no',
                                'date',
                                'collected')
                        ));
                  },
                  child: Text(
                    "Collected",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color:  Color(0xff054b54),
                  borderRadius: BorderRadius.circular(15)
              ),
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: EdgeInsets.all(15),
                      textStyle: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  ShowTable(
                              "http://192.168.1.110:8000/getnotcollecteddata",
                              "Name",
                              "ProperTy Number",
                              "Ward NO",
                              "Date",
                              "Collected",
                              'username',
                              'property_no',
                              'ward_no',
                              'date',
                              'collected')

                             ),
                    );
                  },
                  child: Text(
                    "Not Collected",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color:  Color(0xff054b54),
                  borderRadius: BorderRadius.circular(15)
              ),
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: EdgeInsets.all(15),
                      textStyle: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuggestionShowTable(
                                "http://192.168.1.110:8000/getsuggestionreport",
                                "Suggestion ID",
                                "Name",
                                "Property Number",
                                "Date",
                                "Ward NO",
                                "Suggestion",
                                'suggestion_id',
                                'username',
                                'property_no',
                                'date',
                                'ward_no',
                                'suggestion')));
                  },
                  child: Text(
                    "Suggestions",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color:  Color(0xff054b54),
                  borderRadius: BorderRadius.circular(15)
              ),
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: EdgeInsets.all(15),
                      textStyle: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GCDetails(
                              "http://192.168.1.110:8000/getcomplaintreport",
                              "Complaint Id",
                              "Customer ID",
                              "Date",
                              "Name",
                              "Ward NO",
                              "Property NO",
                              "Complaint Type",
                              "Complaint",
                              'complaint_id',
                              'customerid',
                              'date',
                              'username',
                              'ward_no',
                              'property_no',
                              'complaint_type',
                              'complaint')),
                    );
                  },
                  child: Text(
                    "Complaints",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color:  Color(0xff054b54),
                  borderRadius: BorderRadius.circular(15)
              ),
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: EdgeInsets.all(15),
                      textStyle: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CustomerDetails(
                              "http://192.168.1.110:8000/customers",
                              "ID",
                              "Identity Number",
                              "Ward Number",
                              "Property NO",
                              "Property Type",
                              "Property Tax NO",
                              "Build Permission",
                              "Name",
                              "Father's Name",
                              "Mobile Name",
                              "NO of Members",
                              "Parcel NO",
                              "Electricity Connection",
                              "QR Code",
                              "Paid Property Tax",
                              "Water Tax NO",
                              'id',
                              'identity_no',
                              'ward_no',
                              'property_no',
                              'property_type',
                              'property_tax_no',
                              'building_permission',
                              'username',
                              'father_name',
                              'mobile_no',
                              'no_of_members',
                              'parcelno',
                              'electricity_connection',
                              'qrcode',
                              'paid_property_tax',
                              'water_tax_no')),
                    );
                  },
                  child: Text(
                    "Customer",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color:  Color(0xff054b54),
                  borderRadius: BorderRadius.circular(15)
              ),
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: EdgeInsets.all(15),
                      textStyle: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowTable(
                              "http://192.168.1.110:8000/getcollectionsummary",
                              "Customer ID",
                              "Collector ID",
                              "Date",
                              "Collected",
                              "Reason",
                              'customerid',
                              'collectorid',
                              'date',
                              'collected',
                              'reason')),
                    );
                  },
                  child: Text(
                    "Collection Summary",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color:  Color(0xff054b54),
                  borderRadius: BorderRadius.circular(15)
              ),
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: EdgeInsets.all(15),
                      textStyle: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GCDetails(
                              "http://192.168.1.110:8000/gcdetailsreport",
                              "ID Number",
                              "Identity Type",
                              "Ward Number",
                              "Name",
                              "Father's Name",
                              "QR Code",
                              "Mobile Number",
                              "Address",
                              'gc_identity_no',
                              'gc_identity_type',
                              'gc_ward_no',
                              'gc_username',
                              'gc_fathername',
                              'gc_qrcode',
                              'gc_mobile_no',
                              'gc_address')),
                    );
                  },
                  child: Text(
                    "Garbage Collector Details",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
