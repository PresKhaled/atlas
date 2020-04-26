// Essential Flutter packages
import 'dart:ui';
import 'package:atlas/inc/include.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Include _include = new Include();

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  // Gradient
                  Container(
                    decoration: BoxDecoration(
                      gradient: _include.appGradientColor,
                    ),
                  ),

                  // Sign in background image
                  Container(
                    width: _include.screenSize(context, window).width,
                    height: _include.screenSize(context, window).height,
                    child: Image.asset("${_include.imagesPath}signin_bg.png",
                        fit: BoxFit.fill,
                        semanticLabel: "sign in background image"),),

                  Padding(
                    padding: EdgeInsets.only(
                      top: _include.screenSize(context, window).height / 20,
                      left: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Form to Sign in
                  Center(
                    child: Container(
                      width: double.infinity,
                      height:
                      _include.screenSize(context, window).height * 0.50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: _include.addShadowToWidget,
                      ),
                      child: Column(
                        children: <Widget>[
                          Form(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: _include
                                    .screenSize(context, window)
                                    .height *
                                    0.05,
                                left:
                                _include.screenSize(context, window).width *
                                    0.10,
                                right:
                                _include.screenSize(context, window).width *
                                    0.10,
                              ),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Sign in',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                    MediaQuery.of(context).size.height / 30,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'User name',
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                    MediaQuery.of(context).size.height / 50,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                    MediaQuery.of(context).size.height / 25,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 35,
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(25, .0, 25, 15),
                            child: RaisedButton(
                              onPressed: () => Navigator.pushNamed(context, "/Signup"),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0),
                              ),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: _include.appGradientColor,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxWidth: double.infinity,
                                    minHeight: 50.0,
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom:
                        _include.screenSize(context, window).height / 12,
                        left: _include.screenSize(context, window).width / 10,
                        right: _include.screenSize(context, window).width / 10,
                      ),
                      child: _include.buildDivider(Colors.grey.withOpacity(0.40)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom:
                        _include.screenSize(context, window).height / 20,
                      ),
                      child: RichText(
                        text: TextSpan(
                            text: 'Not a user ? ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(225, 122, 152, 1.0),
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Sign up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.1),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () =>
                                      Navigator.pushNamed(context, "/Signup"),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
