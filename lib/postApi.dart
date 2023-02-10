import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:garbage/Modal/SuggestionModal.dart';
import 'package:http/http.dart' as http;

class ApiCall extends StatefulWidget {
  const ApiCall({Key? key}) : super(key: key);

  @override
  State<ApiCall> createState() => _ApiCallState();
}

//List<suggestionReport> postList = [];
var data;

class _ApiCallState extends State<ApiCall> {
  Future<List> getpostApi() async {
    final response = await http
        .get(Uri.parse("http://192.168.89.73:8000/getsuggestionreport"));
    List postList = await (jsonDecode(response.body.toString()));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getpostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text("Loading");
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(10),
                            child: Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(snapshot.data![index]['username']
                                      .toString()),
                                  Text(
                                      snapshot.data![index]['date'].toString()),
                                  Text(snapshot.data![index]['suggestion']
                                      .toString())

//  Text(postList[index].username.toString()),
//Text(postList[index].suggestion.toString())
                                ],
                              ),
                            ),
                          );
                        });
                    ;
                  }
                }),
          )
        ],
      ),
    ));
  }
}

class Photoes {
  late String title, url;
  Photoes({required this.title, required this.url});
}
