import 'dart:io';


import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class GenerarteQRCode extends StatefulWidget {
  String Identity;
  GenerarteQRCode({ required this.Identity});
  @override

  _GenerarteQRCodeState createState() => _GenerarteQRCodeState();
}

class _GenerarteQRCodeState extends State<GenerarteQRCode> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  var code = '';
  File? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generate QR Code"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
               BarcodeWidget(
                barcode: Barcode.qrCode(
                  errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                ),
                data: '$code',
                width: 200,
                height: 200,
              ),




              MaterialButton(
                color: Colors.blueAccent,
                onPressed: () {
                  setState(() {
                    code = title.text;
                  });
                },
                child: Text(
                  "Show",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
