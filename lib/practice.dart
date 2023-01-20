import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.focused))
                        return Colors.red;
                      if (states.contains(MaterialState.hovered))
                        return Colors.green;
                      if (states.contains(MaterialState.pressed))
                        return Colors.blue;
                      return null; // Defer to the widget's default.
                    }),
              ),
              onPressed: () { },
              child: Text('TextButton with custom overlay colors'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(onSurface: Colors.red),
              onPressed: null,
              child: Text('ElevatedButton with custom disabled colors'),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled))
                        return Colors.red;
                      return null; // Defer to the widget's default.
                    }),
                foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled))
                        return Colors.blue;
                      return null; // Defer to the widget's default.
                    }),
              ),
              onPressed: null,
              child: Text('ElevatedButton with custom disabled colors'),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: StadiumBorder(),
                side: BorderSide(
                    width: 2,
                    color: Colors.red
                ),
              ),
              onPressed: () { },
              child: Text('OutlinedButton with custom shape and border'),
            ),
            OutlinedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
                side: MaterialStateProperty.resolveWith<BorderSide>(
                        (Set<MaterialState> states) {
                      final Color color = states.contains(MaterialState.pressed)
                          ? Colors.blue
                          : Colors.red;
                      return BorderSide(color: color, width: 2);
                    }
                ),
              ),
              onPressed: () { },
              child: Text('OutlinedButton with custom shape and border'),
            )
          ],
        ),
      ),
    );
  }
}
