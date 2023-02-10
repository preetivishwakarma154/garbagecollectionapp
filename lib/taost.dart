//import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
//FToast fToast = FToast();


class FlutterToast extends StatefulWidget {
  const FlutterToast({Key? key}) : super(key: key);

  @override
  State<FlutterToast> createState() => _FlutterToastState();
}

class _FlutterToastState extends State<FlutterToast> {
  @override
  void initState() {
    super.initState();
   // fToast = FToast();
   // fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TextButton(
          onPressed: _showToast,
          child: Text("Widget"),
        ),
      ),
    );
  }
}





_showToast() {
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.green,
    ),
    child: Row(

      children: [
        Icon(Icons.check),
        SizedBox(
          width: 12.0,
        ),
        Text("Successfully Submitted"),
      ],
    ),
  );


  // fToast.showToast(
  //   child: toast,
  //   gravity: ToastGravity.BOTTOM,
  //   toastDuration: Duration(seconds: 1),
  // );

  // Custom Toast Position
  // fToast.showToast(
  //     child: toast,
  //     toastDuration: Duration(seconds: 1),
  //     positionedToastBuilder: (context, child) {
  //       return Positioned(
  //         child: child,
  //         top: 136.0,
  //         left: 116.0,
  //       );
  //     });
}