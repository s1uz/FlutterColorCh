import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainVidget();
  }
}

class MainVidget extends StatefulWidget {
  @override
  MainVidgetState createState() => MainVidgetState();
}

class MainVidgetState extends State<MainVidget> {
  Color _mainColor = Colors.green;
  Color _textColor = Colors.black;
  double _sizeText = 32;

  void changeColor() {
    setState(() {
      _mainColor = Color.fromRGBO(Random().nextInt(254) + 1,
          Random().nextInt(254) + 1, Random().nextInt(254) + 1, 1);
    });
  }

  void changeSize() {
    _sizeText = Random().nextInt(72).toDouble() + 32.0;

    setState(() {
      _textColor = Color.fromRGBO(Random().nextInt(254) + 1,
          Random().nextInt(254) + 1, Random().nextInt(254) + 1, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My test Flutter Application',
      home: Scaffold(
        backgroundColor: _mainColor,
        appBar: AppBar(
          title: Text('Tap anywhere'),
        ),
        body: Stack(
          children: <Widget>[
            Center(
              child: InkWell(
                child: Text('Hey there',
                    style: TextStyle(color: _textColor, fontSize: _sizeText)),
                onTap: () => changeSize(),
              ),
            ),
            Listener(
              behavior: HitTestBehavior.translucent,
              onPointerDown: (e) {
                changeColor();
              },
            ),
          ],
        ),
      ),
    );
  }
}
