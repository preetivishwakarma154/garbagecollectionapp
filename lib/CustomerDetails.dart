import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'Modal/SuggestionModal.dart';

class CustomerDetails extends StatefulWidget {
  CustomerDetails(
    this.url,
    this.FisrtTitle,
    this.SecondTitle,
    this.ThirdTitle,
    this.FourthTitle,
    this.FifthTitle,
    this.SixthTitle,
    this.SeventhTitle,
    this.EighthTitle,
    this.NinethTitle,
    this.TenthTitle,
    this.EleventhTitle,
    this.TwelvethTitle,
    this.ThirtTeenthTitle,
    this.FourteenThTitle,
    this.FifteenThTitle,
    this.SixteenthTitle,
    this.FirstData,
    this.SecondData,
    this.ThirdData,
    this.FourthData,
    this.FifthData,
    this.SixthData,
    this.SeventhData,
    this.EighthData,
    this.NinethDate,
    this.TenthDate,
    this.EleventhDate,
    this.TwelvethDate,
    this.ThirtTeenthDate,
    this.FourteenThDate,
    this.FifteenThDate,
    this.SixteenthDate,
  );
  final String url;
  final String FisrtTitle,
      SecondTitle,
      ThirdTitle,
      FourthTitle,
      FifthTitle,
      SixthTitle,
      SeventhTitle,
      EighthTitle,
      NinethTitle,
      TenthTitle,
      EleventhTitle,
      TwelvethTitle,
      ThirtTeenthTitle,
      FourteenThTitle,
      FifteenThTitle,
      SixteenthTitle;

  final String FirstData,
      ThirdData,
      SecondData,
      FourthData,
      FifthData,
      SixthData,
      SeventhData,
      EighthData,
      NinethDate,
      TenthDate,
      EleventhDate,
      TwelvethDate,
      ThirtTeenthDate,
      FourteenThDate,
      FifteenThDate,
      SixteenthDate;

  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

String collecton = '';
List postList = [];
var inumber = 0;

class _CustomerDetailsState extends State<CustomerDetails> {
  Future<List> getpostApi() async {
    final response = await http.get(Uri.parse(widget.url));
    await Future.delayed(Duration(milliseconds: 1500));
     postList = await (jsonDecode(response.body.toString()));
    if (response.statusCode == 200) {

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
      user[widget.FourthData]
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()) ||
          user[widget.SecondData]
              .toString()
              .contains(enteredKeyword.toLowerCase()) ||
          user[widget.FirstData]
              .toString()
              .contains(enteredKeyword.toLowerCase()))
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
                                          DataColumn(
                                              label: Text(
                                                  widget.SeventhTitle.toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  widget.EighthTitle.toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  widget.NinethTitle.toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  widget.TenthTitle.toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  widget.EleventhTitle.toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  widget.TwelvethTitle.toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  widget.ThirtTeenthTitle.toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  widget.FourteenThTitle.toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  widget.FifteenThTitle.toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  widget.SixteenthTitle.toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),

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
                                          [widget.FourthData]
                                              .toString();
                                          final y = snapshot.data![index][widget.FifthData]
                                              .toString();
                                          final z = snapshot.data![index][widget.SixthData]
                                              .toString();
                                          final a = snapshot.data![index][widget.SeventhData]
                                              .toString();
                                          final b = snapshot.data![index][widget.EighthData]
                                              .toString();
                                          final c = snapshot.data![index][widget.NinethDate]
                                              .toString();
                                          final d = snapshot.data![index][widget.TenthDate]
                                              .toString();
                                          final e = snapshot.data![index][widget.EleventhDate]
                                              .toString();
                                          final f = snapshot.data![index][widget.TwelvethDate]
                                              .toString();
                                          final g = snapshot.data![index][widget.ThirtTeenthDate]
                                              .toString();
                                          final h = snapshot.data![index][widget.FourteenThDate]
                                              .toString();
                                          final i = snapshot.data![index][widget.FifteenThDate]
                                              .toString();
                                          final j = snapshot.data![index][widget.SixteenthDate]
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
                                            DataCell(
                                              Text(c),
                                            ),
                                            DataCell(
                                              Text(d),
                                            ),
                                            DataCell(
                                              Text(e),
                                            ),
                                            DataCell(
                                              Text(f),
                                            ),
                                            DataCell(
                                              Text(g),
                                            ),
                                            DataCell(
                                              Text(h),
                                            ),
                                            DataCell(
                                              Text(i),
                                            ),
                                            DataCell(
                                              Text(j),
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
                                          DataColumn(
                                              label: Text(
                                                  widget.SeventhTitle.toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  widget.EighthTitle.toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  widget.NinethTitle.toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  widget.TenthTitle.toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  widget.EleventhTitle.toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  widget.TwelvethTitle.toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  widget.ThirtTeenthTitle.toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  widget.FourteenThTitle.toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  widget.FifteenThTitle.toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  widget.SixteenthTitle.toString(),
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
                                              final y = _foundUsers[index][widget.FifthData]
                                                  .toString();
                                              final z = _foundUsers[index][widget.SixthData]
                                                  .toString();
                                              final a = _foundUsers[index][widget.SeventhData]
                                                  .toString();
                                              final b = _foundUsers[index][widget.EighthData]
                                                  .toString();
                                              final c =_foundUsers[index][widget.NinethDate]
                                                  .toString();
                                              final d = _foundUsers[index][widget.TenthDate]
                                                  .toString();
                                              final e = _foundUsers[index][widget.EleventhDate]
                                                  .toString();
                                              final f = _foundUsers[index][widget.TwelvethDate]
                                                  .toString();
                                              final g = _foundUsers[index][widget.ThirtTeenthDate]
                                                  .toString();
                                              final h = _foundUsers[index][widget.FourteenThDate]
                                                  .toString();
                                              final i = _foundUsers[index][widget.FifteenThDate]
                                                  .toString();
                                              final j = _foundUsers[index][widget.SixteenthDate]
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
                                                DataCell(
                                                  Text(c),
                                                ),
                                                DataCell(
                                                  Text(d),
                                                ),
                                                DataCell(
                                                  Text(e),
                                                ),
                                                DataCell(
                                                  Text(f),
                                                ),
                                                DataCell(
                                                  Text(g),
                                                ),
                                                DataCell(
                                                  Text(h),
                                                ),
                                                DataCell(
                                                  Text(i),
                                                ),
                                                DataCell(
                                                  Text(j),
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
              Text("Not found"),
        ],
      ),
    ));
  }
}
