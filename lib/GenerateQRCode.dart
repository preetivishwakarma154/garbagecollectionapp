import 'dart:io';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class GenerarteQRCode extends StatefulWidget {
  String Identity;
  GenerarteQRCode({required this.Identity});
  @override
  _GenerarteQRCodeState createState() => _GenerarteQRCodeState();
}

class _GenerarteQRCodeState extends State<GenerarteQRCode> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  var code = '';
  bool qr=false;

  @override
  void initState() {
    print(widget.Identity);
    super.initState();
  }
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
              qr==true?

              code==''?Text(''):
              BarcodeWidget(
                barcode: Barcode.qrCode(
                  errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                ),
                data: '$code',
                width: 200,
                height: 200,
              ):
              MaterialButton(

                color: Color(0xFF03A077),
                onPressed: () {
                  setState(() {
                    qr=true;
                    code = widget.Identity;
                  });
                },
                child: Text(
                  "Show QR",
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
