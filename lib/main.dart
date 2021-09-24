import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(IncremButton());

class Box extends StatefulWidget {
  @override
  State<Box> createState() => BoxState();
}

class IncremButton extends StatefulWidget {
  @override
  State<IncremButton> createState() => IncremButtonState();
}

class IncremButtonState extends State<IncremButton> {
  int _counter = 0;
  void increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MY_PROJ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(_counter.toString()),
        ),
        body: Container(alignment: Alignment.center, child: Box()),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Colors.black38,
          child: Container(
            height: 50.0,
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: increment,
            tooltip: 'increment Counter',
            child: Icon(Icons.add)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class BoxState extends State<Box> {
  Color? color;

  @override
  void initState() {
    pressButton();
    super.initState();
  }

  void pressButton() {
    setState(() {
      color =
          Color((Random().nextDouble() * 0x1000000).toInt()).withOpacity(1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pressButton(),
      child: Container(
        alignment: Alignment.center,
        color: color,
        child: Text(
          "Hey there!!!",
          style: TextStyle(fontSize: 50, color: Colors.black),
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}
