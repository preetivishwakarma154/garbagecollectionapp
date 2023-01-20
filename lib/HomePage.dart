import 'package:flutter/material.dart';
import 'package:garbage/Login.dart';

import 'Collection.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              child:Text(""),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, top: 10, bottom: 20),
            child: Text(
              "Reports",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 36),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: <Color>[
                      Color(0xff5e7ec7),
                      Color(0xFF82c4f0),
                    ])),
                  )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          primary: Colors.white,
                          textStyle: TextStyle(fontSize: 20)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Collected()),
                        );
                      },
                      child: Text("Collected"))
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: <Color>[
                      Color(0xff5e7ec7),
                      Color(0xFF82c4f0),
                    ])),
                  )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          primary: Colors.white,
                          textStyle: TextStyle(fontSize: 20)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Collected()),
                        );
                      },
                      child: Text("Not Collected"))
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: <Color>[
                      Color(0xff5e7ec7),
                      Color(0xFF82c4f0),
                    ])),
                  )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          primary: Colors.white,
                          textStyle: TextStyle(fontSize: 20)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Collected()),
                        );
                      },
                      child: Text("Not Attended"))
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: <Color>[
                      Color(0xff5e7ec7),
                      Color(0xFF82c4f0),
                    ])),
                  )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          primary: Colors.white,
                          textStyle: TextStyle(fontSize: 20)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Collected()),
                        );
                      },
                      child: Text("Suggestions"))
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: <Color>[
                      Color(0xff5e7ec7),
                      Color(0xFF82c4f0),
                    ])),
                  )),
                 ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          primary: Colors.white,
                          textStyle: TextStyle(fontSize: 20)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Collected()),
                        );
                      },
                      child: Text("Collection Summary"))
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: <Color>[
                      Color(0xff5e7ec7),
                      Color(0xFF82c4f0),
                    ])),
                  )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          primary: Colors.white,
                          textStyle: TextStyle(fontSize: 20)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Collected()),
                        );
                      },
                      child: Text("Customers"))
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: <Color>[
                      Color(0xff5e7ec7),
                      Color(0xFF82c4f0),
                    ])),
                  )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          primary: Colors.white,
                          textStyle: TextStyle(fontSize: 20)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Collected()),
                        );
                      },
                      child: Text("Collection Summary"))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
