import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'Modal/SuggestionModal.dart';

class SuggestionShowTable extends StatefulWidget {
  SuggestionShowTable(
    this.url,
    this.FirstTitle,
    this.SecondTitle,
    this.ThirdTitle,
    this.FourthTitle,
    this.FifthTitle,
    this.SixthTitle,
    this.FirstData,
    this.SecondData,
    this.ThirdData,
    this.FourthData,
    this.FifthData,
    this.SixthData,
  );
  final String url;
  final String FirstTitle,
      SecondTitle,
      ThirdTitle,
      FourthTitle,
      FifthTitle,
      SixthTitle;

  final String FirstData,
      ThirdData,
      SecondData,
      FourthData,
      FifthData,
      SixthData;

  @override
  State<SuggestionShowTable> createState() => _SuggestionShowTableState();
}

List postList = [];

class _SuggestionShowTableState extends State<SuggestionShowTable> {
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
              user[widget.FifthData]
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()) ||
              user[widget.SecondData]
                  .toString()
                  .contains(enteredKeyword.toLowerCase())
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
                    hintText: "Search by Name or Ward Number",
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
                      return Center(child: LoadingAnimationWidget.discreteCircle(color: Color(0xff074d58), size: 150));
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

                                                fontWeight: FontWeight.bold,
                                                color:   Color(0xff05535f)),
                                          )),
                                          DataColumn(
                                              label: Text(widget.FirstTitle,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:   Color(0xff05535f)))),
                                          DataColumn(
                                              label: Text(widget.SecondTitle,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:   Color(0xff05535f)))),
                                          DataColumn(
                                              label: Text(widget.ThirdTitle,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:   Color(0xff05535f)))),
                                          DataColumn(
                                              label: Text(
                                                  widget.FourthTitle.toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:   Color(0xff05535f)),
                                              )),
                                          DataColumn(
                                              label: Text(
                                                  widget.FifthTitle.toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      color:   Color(0xff05535f)))),
                                          DataColumn(
                                              label: Text(
                                                  widget.SixthTitle.toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      color:   Color(0xff05535f)))),
                                        ],
                                        columnSpacing: 40,
                                        horizontalMargin: 40,
                                        rows: List.generate(
                                            snapshot.data!.length, (index) {
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
                                                  [widget.FourthData].toString();

                                          final y = snapshot.data![index][widget.FifthData]
                                              .toString();
                                          final z = snapshot.data![index][widget.SixthData]
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
                                              label: Text(widget.FirstTitle,
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
                                                  widget.FourthTitle.toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  widget.FifthTitle.toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  widget.SixthTitle.toString(),
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
                                          final x = _foundUsers[index]
                                                  [widget.FourthData]
                                              .toString();
                                          final y = _foundUsers[index]
                                          [widget.FifthData]
                                              .toString();
                                          final z = _foundUsers[index]
                                          [widget.SixthData]
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
