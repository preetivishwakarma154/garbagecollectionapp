// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// import 'RegistrationModal.dart';
// const PROTOCOL = "http";
// const DOMAIN= "192.168.1.109";
// Future<registerModal>htto_get(String route,[dynamic data])async{
//   var dataStr = jsonEncode(data);
//   var url = "$PROTOCOL://$DOMAIN/$route?data=$dataStr";
//   var result = await http.get(url);
//   return registerModal(true,jsonDecode(result.body));
// }
// Future<registerModal>htto_post(String route,[dynamic data])async{
//   var dataStr = jsonEncode(data);
//   var url = "$PROTOCOL://$DOMAIN/$route?data=$dataStr";
//   var result = await http.get(url);
//   return registerModal(true,jsonDecode(result.body));
// }
//
