// Essential Flutter packages
import 'package:flutter/material.dart';

// Internal resources
import 'landing.dart' show Landing;

void main() => runApp(Main());

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Landing()
    );
  }
}