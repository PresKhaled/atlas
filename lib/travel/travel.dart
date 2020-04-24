// Dart arms
import 'dart:ui';

// Essential Flutter packages
import 'package:flutter/material.dart';

// Internal resources
import '../inc/include.dart' show Include;

class Travel extends StatefulWidget {
  @override
  _TravelState createState() => _TravelState();
}

class _TravelState extends State<Travel> {
  Include _inc = new Include();
  //String _currentSection;
  //Color _travelPrimaryColor = Color.fromRGBO(252, 172, 178, 1);
  List<Shadow> _travelPrimaryTextShadow = [
    Shadow(color: Colors.black12, blurRadius: 5)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _inc.propperAppBar(title: "Travelling", travel: true),
        body: Container(
            height: _inc.screenSize(context, window).height,
            child: Column(children: <Widget>[
              Expanded(
                  child: Stack(children: <Widget>[
                // Gradient
                Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                  _inc.appGradientPink,
                  _inc.appGradientLightPink
                ], stops: [
                  .2,
                  1
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter))),

                // Content
                Container(
                    child: Column(children: <Widget>[
                  // Header
                  Container(
                      padding: EdgeInsets.fromLTRB(30, 60, 30, 60),
                      child: Column(children: <Widget>[
                        // Heading
                        Text("Pick a category for your next adventure",
                            style: TextStyle(
                                color: Colors.white54,
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                height: 1.4,
                                letterSpacing: 2)),

                        // Select section
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Container(
                                margin: EdgeInsets.only(top: 15),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 3, color: Colors.white54)),
                                ),
                                child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      // Current section
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 7),
                                        child: Text("Popluar",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 28,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 1,
                                                shadows:
                                                    _travelPrimaryTextShadow)),
                                      ),

                                      // Down arrow (expand list)
                                      Padding(
                                        padding: EdgeInsets.only(left: 8),
                                        child: Image.asset(
                                            "assets/images/down-arrow.png",
                                            scale: 2.5,
                                            semanticLabel: "Expand list"),
                                      )
                                    ]))),
                      ])),

                  // Divider
                  Padding(
                    padding: EdgeInsets.only(right: 20, left: 20),
                    child: Divider(thickness: 1.5, color: Colors.white30),
                  ),

                  // Selected section results (hotels)
                  Container(
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 30),
                      child: Column(children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              // Current section name or alias
                              Padding(
                                padding: EdgeInsets.only(bottom: 7),
                                child: Text("Featured",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1,
                                        shadows: _travelPrimaryTextShadow)),
                              ),

                              // Travel section Navigate
                              RaisedButton(
                                  onPressed: () {}, child: Text("See all"))
                            ]),

                            
                        Container(
                            height: 300,
                            child: OverflowBox(
                                maxWidth:
                                    _inc.screenSize(context, window).width,
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Expanded(
                                          child: ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: <Widget>[
                                            Card(child: Text("Card #1")),
                                            Card(child: Text("Card #1")),
                                            Card(child: Text("Card #1")),
                                            Card(child: Text("Card #1")),
                                            Card(child: Text("Card #1")),
                                            Card(child: Text("Card #1")),
                                            Card(child: Text("Card #1")),
                                            Card(child: Text("Card #1")),
                                          ]))
                                    ])))
                      ]))
                ]))
              ]))
            ])));
  }
}
