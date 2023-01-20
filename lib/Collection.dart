import 'package:flutter/material.dart';
class Collected extends StatefulWidget {
  const Collected({Key? key}) : super(key: key);

  @override
  State<Collected> createState() => _CollectedState();
}

class _CollectedState extends State<Collected> {
  @override
  Widget build(BuildContext context) {
    final _verticalScrollController = ScrollController();
    final _horizontalScrollController = ScrollController();
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            controller: _verticalScrollController,
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
                controller: _horizontalScrollController,
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.only(right: 8.0,bottom: 16.0),
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text("SNO",style: TextStyle(

                        fontSize: 18,
                        fontWeight: FontWeight.bold

                      ),)),
                      DataColumn(label: Text("Customer Name",style: TextStyle(

                          fontSize: 18,
                          fontWeight: FontWeight.bold

                      ))),
                      DataColumn(label: Text("Custoner Location",style: TextStyle(

                          fontSize: 18,
                          fontWeight: FontWeight.bold

                      ))),
                      DataColumn(label: Text("Visited On",style: TextStyle(

                          fontSize: 18,
                          fontWeight: FontWeight.bold

                      ))),
                      DataColumn(label: Text("Collection Location",style: TextStyle(

                          fontSize: 18,
                          fontWeight: FontWeight.bold

                      ))),
                    ],
                    columnSpacing: 40,
                    horizontalMargin: 40,
                    rows: [

                      DataRow(
                          cells:[
                        DataCell(Text("Ram"),),
                        DataCell(Text("Ram"),),
                        DataCell(Text("Ram"),),
                        DataCell(Text("Ram"),),
                        DataCell(Text("Ram"),),
                      ]
                      ),
                      DataRow(
                          cells:[
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                          ]
                      ),
                      DataRow(
                          cells:[
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                          ]
                      ),
                      DataRow(
                          cells:[
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                          ]
                      ),
                      DataRow(
                          cells:[
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                          ]
                      ),
                      DataRow(
                          cells:[
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                          ]
                      ),
                      DataRow(
                          cells:[
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                          ]
                      ),
                      DataRow(
                          cells:[
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                          ]
                      ),
                      DataRow(
                          cells:[
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                          ]
                      ),
                      DataRow(
                          cells:[
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                          ]
                      ),
                      DataRow(
                          cells:[
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                          ]
                      ),
                      DataRow(
                          cells:[
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                          ]
                      ),
                      DataRow(
                          cells:[
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                          ]
                      ),
                      DataRow(
                          cells:[
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                          ]
                      ),DataRow(
                          cells:[
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                          ]
                      ),DataRow(
                          cells:[
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                          ]
                      ),DataRow(
                          cells:[
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                          ]
                      ),
                      DataRow(
                          cells:[
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                          ]
                      ),
                      DataRow(
                          cells:[
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                          ]
                      ),DataRow(
                          cells:[
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                            DataCell(Text("Ram"),),
                          ]
                      ),







                    ],
                  ),
                )
            ),
          ),
        ),
      ),
    );

      }
}



