import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:garbage/Modal/SuggestionModal.dart';
import 'package:garbage/showUserDetails.dart';
import 'package:http/http.dart' as http;

class SuggestionTable extends StatefulWidget {
  const SuggestionTable({Key? key}) : super(key: key);



  @override
  State<SuggestionTable> createState() => _SuggestionTableState();
}
String collecton='';
List<dynamic> dataList = [];


class _SuggestionTableState extends State<SuggestionTable> {
var data;


  Future<void> getSuggestion() async {
    try{
      final response = await http
          .get(Uri.parse("http://192.168.1.110:8000/getcomplaintreport"));
         dataList = await jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
       // for(Map<String, dynamic> i in data){
       //   dataList.add(suggestionReport.fromJson(i));
       // }
        // setState(() {
           data =  jsonDecode(response.body.toString());
        // });
        //
        // print("collection $dataList");
      ///  print(collecton);

        //eturn dataList;
      } else {
        print(response.reasonPhrase);
        //return dataList;
      }
    }catch(e){
      print(e.toString());
    }
  }
  @override
  void initState() {
    getSuggestion();
    setState(() {
      getSuggestion();
    });
    super.initState();
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
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder(
                    future: getSuggestion(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState== ConnectionState.waiting) {
                        return Text("Loading ...");
                      } else {
                        return Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              itemCount: dataList.length,
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
                                              label: Text("widget.nameTitle",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text("widget.customerLocation",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text("widget.VisitedOn",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                          DataColumn(
                                              label: Text(
                                                  "widget.Collected".toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold))),
                                        ],
                                        columnSpacing: 40,
                                        horizontalMargin: 40,
                                        rows: [
                                          DataRow(cells: [
                                            DataCell(
                                              Text(index.toString()),
                                            ),
                                            DataCell(
                                              Text(dataList[index]['username']
                                                  .toString()),
                                            ),
                                            DataCell(
                                              Text(dataList[index]
                                              ['date']
                                                  .toString()),
                                            ),
                                            DataCell(
                                              Text(dataList[index]
                                              ['suggestionId']
                                                  .toString()),
                                            ),
                                            DataCell((Text(dataList[index]
                                            ['suggestion']
                                                .toString()))),
                                          ]),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        );
                      }
                    }),
              ),
            ],
          ),
        ));
  }
}
