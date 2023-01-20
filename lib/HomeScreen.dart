import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:garbage/Login.dart';

import 'Collection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gaabage Collection"),
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
              child: Image(image: AssetImage("assets/user.png",))
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(5, 20, 5, 20),
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(10),

            decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
                  Color(0xff5e7ec7),
                  Color(0xFF82c4f0),
                ])),
            child: Text("Reports",


              style:
              TextStyle(fontWeight: FontWeight.w700, color: Colors.white,fontSize: 18),),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    textStyle: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Collected()),
                  );
                },
                child: Text(
                  "Collected",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    textStyle: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Collected()),
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
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    textStyle: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Collected()),
                  );
                },
                child: Text(
                  "Not Attended",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    textStyle: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Collected()),
                  );
                },
                child: Text(
                  "Suggestions",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    textStyle: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Collected()),
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
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    textStyle: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Collected()),
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
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    textStyle: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Collected()),
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
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    textStyle: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Collected()),
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
    );
  }
}
