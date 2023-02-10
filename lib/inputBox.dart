import 'package:flutter/material.dart';
class InputBox extends StatelessWidget {
  InputBox({required this.controller,required this.inputType,required this.lableText, required this.hintText});
final String lableText;
  final String hintText;
final TextEditingController controller;
final TextInputType inputType;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
              BorderSide(color: Color(0xff042A2F), width: 2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey, width: 2)),
          labelText: lableText,
          hintText: hintText
        ),
      ),
    );


  }
}
