import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class SearchBarScreen extends StatefulWidget {
  const SearchBarScreen({Key? key}) : super(key: key);

  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {
  List postList = [];
  Future<List> getpostApi() async {
    final response = await http
        .get(Uri.parse("http://192.168.0.103:8000/getcomplaintreport"));
    postList = await (jsonDecode(response.body.toString()));

    if (response.statusCode == 200) {
      setState(() {
        //  _foundUsers=postList;
      });
      print(postList);
      return postList;
    } else {
      return postList;
    }
  }

  // This list holds the data for the list view


  @override
  initState() {
    getpostApi();
    print("  state $postList");
    _foundUsers = postList;

    setState(() {
      _foundUsers = postList;
      print(" set state $_foundUsers");
    });

    // at the beginning, all users are shown

    super.initState();
  }
  List _foundUsers = [];

  List results = [];
  bool check = false;
  // This function is called whenever the text field changes
  _runFilter(String enteredKeyword) {
    results = [];
    List results2 = [];

    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = postList;
      // Text("Not found");
    } else {
      results = postList
          .where((user) =>
              user['complaint_id']
                  .toString()
                  .contains(enteredKeyword.toLowerCase()) ||
               user['date'].toString().contains(enteredKeyword.toLowerCase())

      )
          .toList();
      print("Results $results");

      // we use the toLowerCase() method to make it case-insensitive
    }
    // Refresh the UI
    setState(() {
      if (results.isNotEmpty) {
        _foundUsers = results;
      } else {
        _foundUsers = ["not collect"];
      }

      //  check = true;
      print(check);
    });

    ///  print(check);
    return results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15),
                    hintText: "Search",
                    suffixIcon: const Icon(Icons.search),
                    // prefix: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(),
                    ))),
          ),
          if (_foundUsers.isEmpty)
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                  future: getpostApi(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text("Loading ...");
                    } else {
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      DataTable(
                                        columns: [
                                          DataColumn(
                                              label: Text(
                                            "SNO",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          )),
                                          DataColumn(
                                              label: Text("widget.FirstTitle",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          DataColumn(
                                              label: Text("feild",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          DataColumn(
                                              label: Text("widget.ThirdTitle",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  "widget.FourthTitle"
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  "widget.FourthTitle"
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  "widget.FourthTitle"
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  "widget.FourthTitle"
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  "widget.FourthTitle"
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                        ],
                                        columnSpacing: 40,
                                        horizontalMargin: 40,
                                        rows: List.generate(postList.length,
                                            (index) {
                                          final u = snapshot.data![index]
                                                  ['complaint_id']
                                              .toString();
                                          final v = snapshot.data![index]
                                          ['customerid']
                                              .toString();

                                          final w = snapshot.data![index]
                                                  ['complaint_type']
                                              .toString();
                                          final x = snapshot.data![index]
                                                  ['date']
                                              .toString();
                                          final y = snapshot.data![index]
                                                  ['username']
                                              .toString();
                                          final z = snapshot.data![index]
                                          ['ward_no']
                                              .toString();
                                          final a = snapshot.data![index]
                                          ['property_no']
                                              .toString();
                                          final b = snapshot.data![index]['complaint']
                                              .toString();
                                          final num = index + 1;
                                          return DataRow(cells: [
                                            DataCell(
                                              Text(num.toString()),
                                            ),
                                            DataCell(
                                              Text(u),
                                            ),
                                            DataCell(
                                              Text(v),
                                            ),
                                            DataCell(
                                              Text(w),
                                            ),
                                            DataCell(
                                              Text(x),
                                            ),
                                            DataCell(
                                              Text(y),
                                            ),
                                            DataCell(
                                              Text(z),
                                            ),
                                            DataCell(
                                              Text(a),
                                            ),
                                            DataCell(
                                              Text(b),
                                            ),
                                          ]);
                                        }),
                                      ),
                                    ]),
                              );
                            }),
                      );
                    }
                  }),
            )
          else if (results.isNotEmpty)
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                  future: getpostApi(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text("Loading ...");
                    } else {
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            itemCount: _foundUsers.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      DataTable(
                                        columns: [
                                          DataColumn(
                                              label: Text(
                                            "SNO",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          )),
                                          DataColumn(
                                              label: Text("widget.FirstTitle",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          DataColumn(
                                              label: Text("feild",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          DataColumn(
                                              label: Text("widget.ThirdTitle",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  "widget.FourthTitle"
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  "widget.FourthTitle"
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  "widget.FourthTitle"
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  "widget.FourthTitle"
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  "widget.FourthTitle"
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                        ],
                                        columnSpacing: 40,
                                        horizontalMargin: 40,
                                        rows: List.generate(_foundUsers.length,
                                            (index) {
                                          final u = _foundUsers[index]
                                                  ['complaint_id']
                                              .toString();

                                          final v = _foundUsers[index]
                                                  ['complaint_type']
                                              .toString();
                                          final w = _foundUsers[index]
                                                  ['complaint']
                                              .toString();
                                          final x = _foundUsers[index]['date']
                                              .toString();
                                          final y = _foundUsers[index]
                                          ['username']
                                              .toString();
                                          final z = _foundUsers![index]
                                          ['ward_no']
                                              .toString();
                                          final a = _foundUsers[index]
                                          ['property_no']
                                              .toString();
                                          final b = _foundUsers[index]['complaint']
                                              .toString();
                                          final num = index + 1;
                                          return DataRow(cells: [
                                            DataCell(
                                              Text(num.toString()),
                                            ),
                                            DataCell(
                                              Text(u),
                                            ),
                                            DataCell(
                                              Text(v),
                                            ),
                                            DataCell(
                                              Text(w),
                                            ),
                                            DataCell(
                                              Text(x),
                                            ),
                                            DataCell(
                                              Text(y),
                                            ),
                                            DataCell(
                                              Text(z),
                                            ),
                                            DataCell(
                                              Text(a),
                                            ),
                                            DataCell(
                                              Text(b),
                                            ),
                                          ]);
                                        }),
                                      ),
                                    ]),
                              );
                            }),
                      );
                    }
                  }),
            )
          else if (check == false)
            Text("Not found")
        ],
      ),
    ));
  }
}
