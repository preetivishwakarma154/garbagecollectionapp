import 'package:flutter/material.dart';
import 'Collection.dart';
class Buttons extends StatelessWidget {
  Buttons({required this.text,required this.collected});
final Text text;

//Function function;

Collected collected = Collected();

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Collected()),
            );
          },
          child: Text(
            "Collected",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
