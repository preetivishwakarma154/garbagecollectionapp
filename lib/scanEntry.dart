import 'package:flutter/material.dart';

import 'Login.dart';
import 'QRCodeScanner.dart';

class ScanEntry extends StatefulWidget {
  const ScanEntry({Key? key}) : super(key: key);

  @override
  State<ScanEntry> createState() => _ScanEntryState();
}

class _ScanEntryState extends State<ScanEntry> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _tabBarView = [

      Column(
        children: [
          Container(

            margin: EdgeInsets.only(top: 30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shadowColor: Colors.red,

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRCodeScanner()),
                );
              },
              child: Text("Start Scanning",
              style: TextStyle(
                fontSize: 18,
              ),),
            ),
          ),
        ],
      ),
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                decoration:  InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Color(0xff5e7ec7),
                          width: 2
                      )
                  ),
                  enabledBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2
                      )
                  ) ,

                  labelText: 'ByQrCode',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                decoration:  InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Color(0xff5e7ec7),
                          width: 2
                      )
                  ),
                  enabledBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2
                      )
                  ) ,

                  labelText: 'Ward',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                decoration:  InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Color(0xff5e7ec7),
                          width: 2
                      )
                  ),
                  enabledBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2
                      )
                  ) ,

                  labelText: 'Parcel No',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                decoration:  InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Color(0xff5e7ec7),
                          width: 2
                      )
                  ),
                  enabledBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2
                      )
                  ) ,

                  labelText: 'Property No',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Login()),
                  // );
                },
                child: Text("Search",style: TextStyle(
                  fontSize: 18,
                ),),
              ),
            )
          ],
        ),
      ),
    ];
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Customer Registration"),
            bottom: TabBar(
              tabs: [Text("Scan QR Code",style: TextStyle(
                fontSize: 18,
              ),), Text("Manual Entry",style: TextStyle(
                fontSize: 18,
              ),)],
            ),
          ),
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Drawer Header'),
                ),
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
                    Icons.train,
                  ),
                  title: const Text('Page 2'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          body: Center(
            child: TabBarView(
              children: _tabBarView,
            ),
          ),
        ));
  }
}
