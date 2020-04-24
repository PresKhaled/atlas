// Dart arms
import 'dart:ui';

// Essential Flutter packages
import 'package:atlas/inc/drawer.dart';
import 'package:flutter/material.dart';

// Internal relatives
import 'inc/include.dart' show Include;
import 'account/signin.dart' show Signin;
import 'account/signup.dart' show Signup;

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  // Properties
  Color _orDividerColor = Color.fromRGBO(225, 122, 152, 1.0);
  double _orDividerHeightThickness = 2.0;

  Include _include = new Include();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: sideDrawer(),
        body: Container(
            child: Column(children: <Widget>[
          Expanded(
              child: Stack(children: <Widget>[
            // Gradient
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
              Color.fromRGBO(193, 55, 111, 0.9),
              Color.fromRGBO(241, 120, 100, 0.9)
            ], stops: [
              .2,
              1
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter))),

            // Landing background image
            Container(
                width: _include.screenSize(context, window).width,
                height: _include.screenSize(context, window).height,
                child: Image.asset("assets/images/landing_bg.png",
                    fit: BoxFit.fill,
                    semanticLabel: "Landing background image")),

            // Header, Form
            Container(
                padding: EdgeInsets.only(top: _include.statusBar(context)),
                child: Column(children: <Widget>[
                  // Header
                  Container(
                      height:
                          (_include.screenSize(context, window).height / 2) -
                              (_include.statusBar(context) / 2),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // Atlas logo
                            Container(
                              margin: EdgeInsets.only(bottom: 25.0),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        color: Color.fromRGBO(0, 0, 0, .2),
                                        spreadRadius: -1,
                                        blurRadius: 10)
                                  ]),
                              child: Image.asset("assets/images/logo.png",
                                  width: 90, semanticLabel: "Atlas Logo"),
                            ),

                            // App name
                            Text(
                              "atlas".toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 10),
                            ),

                            // Written app logo (Image)
                            Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Image.asset(
                                  "assets/images/written-logo.png",
                                  semanticLabel: "Written app logo",
                                  scale: 3,
                                ))
                          ])),

                  // Form
                  Container(
                      height:
                          (_include.screenSize(context, window).height / 2) -
                              (_include.statusBar(context) / 2),
                      child: Form(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                            // Signin button
                            Container(
                                width: double.infinity,
                                margin: EdgeInsets.fromLTRB(25, .0, 25, 15),
                                child: Container(
                                  decoration:
                                      BoxDecoration(boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        color: Color.fromRGBO(0, 0, 0, .2),
                                        spreadRadius: -1,
                                        blurRadius: 10)
                                  ]),
                                  child: FlatButton(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      padding:
                                          EdgeInsets.only(top: 20, bottom: 20),
                                      onPressed: () =>
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          new Signin()),
                                              ModalRoute.withName("/Signin")),
                                      child: Text("Sign in",
                                          style: TextStyle(
                                              color: _include.appPrimaryColor,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.5)),
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(35))),
                                )),

                            // OR line
                            Padding(
                                padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                          child: Divider(
                                              thickness:
                                                  _orDividerHeightThickness,
                                              height: _orDividerHeightThickness,
                                              color: _orDividerColor)),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              right: 10, left: 10),
                                          child: Text("or".toUpperCase(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 2.5))),
                                      Expanded(
                                          child: Divider(
                                              thickness:
                                                  _orDividerHeightThickness,
                                              height: _orDividerHeightThickness,
                                              color: _orDividerColor))
                                    ])),

                            // Signup button
                            Container(
                                width: double.infinity,
                                margin: EdgeInsets.fromLTRB(25, 15, 25, 0),
                                child: RaisedButton(
                                    elevation: 0,
                                    highlightElevation: 0,
                                    disabledElevation: 0,
                                    padding:
                                        EdgeInsets.only(top: 20, bottom: 20),
                                    onPressed: () =>
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        new Signup()),
                                            ModalRoute.withName("/Signup")),
                                    child: Text("Create an account",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.8)),
                                    color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Color.fromRGBO(
                                                221, 152, 176, 1),
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(35))))
                          ])))
                ]))
          ]))
        ])));
  }
}
