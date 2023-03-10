import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Modal/SuggestionModal.dart';

class Collection extends StatefulWidget {
  Collection(
    this.url,
    this.FisrtTitle,
    this.SecondTitle,
    this.ThirdTitle,
    this.FourthTitle,
    this.FirstData,
    this.SecondData,
    this.ThirdData,
    this.FourthData,

  );
  final String url;
  final String FisrtTitle, SecondTitle, ThirdTitle, FourthTitle;
  final String FirstData, ThirdData, SecondData, FourthData;

  @override
  State<Collection> createState() => _CollectionState();
}
List postList=[];
class _CollectionState extends State<Collection> {
  Future<List> getpostApi() async {
    final response = await http
        .get(Uri.parse(widget.url));
    postList = await (jsonDecode(response.body.toString()));

    if (response.statusCode == 200) {
      setState(() {
        //  _foundUsers=postList;
      });

      return postList;
    } else {
      return postList;
    }
  }

  @override
  void initState() {
    getpostApi();
    setState(() {
      getpostApi();
    });
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

  int number = 0;
  @override
  Widget build(BuildContext context) {
    final _verticalScrollController = ScrollController();
    final _horizontalScrollController = ScrollController();
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
                                                  label: Text(widget.FisrtTitle,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                          FontWeight.bold))),
                                              DataColumn(
                                                  label: Text(widget.SecondTitle,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                          FontWeight.bold))),
                                              DataColumn(
                                                  label: Text(widget.ThirdTitle,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                          FontWeight.bold))),
                                              DataColumn(
                                                  label: Text(
                                                      widget.FourthTitle
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
                                                  [widget.FirstData]
                                                      .toString();

                                                  final v = snapshot.data![index]
                                                  [widget.SecondData]
                                                      .toString();
                                                  final w = snapshot.data![index]
                                                  [widget.ThirdData]
                                                      .toString();
                                                  final x = snapshot.data![index]
                                                  [widget.FourthData]
                                                      .toString();
                                                  final y = snapshot.data![index]['']
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
                                                  label: Text(widget.FisrtTitle,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                          FontWeight.bold))),
                                              DataColumn(
                                                  label: Text(widget.SecondTitle,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                          FontWeight.bold))),
                                              DataColumn(
                                                  label: Text(widget.ThirdTitle,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                          FontWeight.bold))),
                                              DataColumn(
                                                  label: Text(
                                                      widget.FourthTitle
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
                                                  [widget.FirstData]
                                                      .toString();

                                                  final v = _foundUsers[index]
                                                  [widget.SecondData]
                                                      .toString();
                                                  final w = _foundUsers[index]
                                                  [widget.ThirdData]
                                                      .toString();
                                                  final x = _foundUsers[index][widget.FourthData]
                                                      .toString();
                                                  final y =
                                                  _foundUsers[index][''].toString();
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
