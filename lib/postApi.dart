// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// List<PostModal> postList = [];
//
// class _HomeScreenState extends State<HomeScreen> {
//   Future<List<PostModal>> getpostApi() async {
//     final response =
//     await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
//     var data = jsonDecode(response.body.toString());
//     if (response.statusCode == 200) {
//       for (Map i in data) {
//         postList.add(PostModal.fromJson(i));
//       }
//       return postList;
//     } else {
//       return postList;
//     }
//   }
//
//   List<Photoes> photolist = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//           child: Column(
//             children: [
//               Expanded(
//                 child: FutureBuilder(
//                     future: getpostApi(),
//                     builder: (context, snapshot) {
//                       if (!snapshot.hasData) {
//                         return Text("Loading");
//                       } else {
//                         return ListView.builder(
//                             itemCount: postList.length,
//                             itemBuilder: (context, index) {
//                               return Padding(
//                                 padding: EdgeInsets.all(10),
//                                 child: Card(
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(postList[index].title.toString()),
//                                       Text(postList[index].body.toString())
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             });
//                       }
//                     }),
//               )
//             ],
//           ),
//         ));
//   }
// }
//
// class Photoes {
//   late String title, url;
//   Photoes({required this.title, required this.url});
// }
