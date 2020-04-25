// Essential Flutter packages
import 'dart:ui';
import 'package:atlas/inc/include.dart';
import 'package:atlas/landing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../travel/travel.dart' show Travel;

Include _include = new Include();

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool agree = false;
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _repeatPasswordController = new TextEditingController();
  void clearTextField(TextEditingController textField) {
    setState(() {
      textField.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  // Gradient Back Ground
                  Container(
                    decoration: BoxDecoration(
                      gradient: _include.appGradientColor,
                    ),
                  ),

                  // Signup background image
                  Container(
                    width: _include.screenSize(context, window).width,
                    height: _include.screenSize(context, window).height,
                    child: Image.asset("${_include.imagesPath}/signup_bg.png",
                        fit: BoxFit.fill,
                        semanticLabel: "sign up background image"),
                  ),

                  // Back Arrow (Navigator pop)
                  Padding(
                    padding: EdgeInsets.only(
                      top: _include.screenSize(context, window).height / 20,
                      left: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          onPressed: () => Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Landing()),
                              ModalRoute.withName('Landing')),
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Form to Signup
                  Center(
                    child: Container(
                      width: double.infinity,
                      height:
                          _include.screenSize(context, window).height * 0.64,
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
                                    'Join Us',
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
                                    controller: _usernameController,
                                    decoration: InputDecoration(
                                        hintText: 'Username',
                                        suffixIcon:
                                            _usernameController.text != ""
                                                ? IconButton(
                                                    onPressed: () {
                                                      clearTextField(
                                                          _usernameController);
                                                    },
                                                    icon: Icon(Icons.close))
                                                : null),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 50,
                                  ),
                                  TextField(
                                    controller: _passwordController,
                                    decoration: InputDecoration(
                                        hintText: 'Password',
                                        suffixIcon:
                                            _passwordController.text != ""
                                                ? IconButton(
                                                    onPressed: () {
                                                      clearTextField(
                                                          _passwordController);
                                                    },
                                                    icon: Icon(Icons.close))
                                                : null),
                                    obscureText: true,
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 50,
                                  ),
                                  TextField(
                                    controller: _repeatPasswordController,
                                    decoration: InputDecoration(
                                        hintText: 'Repeat Password',
                                        suffixIcon:
                                            _repeatPasswordController.text != ""
                                                ? IconButton(
                                                    onPressed: () {
                                                      clearTextField(
                                                          _repeatPasswordController);
                                                    },
                                                    icon: Icon(
                                                      Icons.close,
                                                    ))
                                                : null),
                                    obscureText: true,
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 50,
                                  ),
                                  TextField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                        hintText: 'Email Address',
                                        suffixIcon: _emailController.text != ""
                                            ? IconButton(
                                                onPressed: () {
                                                  clearTextField(
                                                      _emailController);
                                                },
                                                icon: Icon(Icons.close))
                                            : null),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 25,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            agree = !agree;
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(right: 10),
                                          height: 25,
                                          width: 25,
                                          decoration: agree
                                              ? BoxDecoration(
                                                  gradient:
                                                      _include.appGradientColor,
                                                  borderRadius:
                                                      BorderRadius.circular(10))
                                              : BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      width: 3,
                                                      color: _include
                                                          .appPrimaryColor)),
                                          child: agree
                                              ? Icon(
                                                  Icons.done,
                                                  size: 18,
                                                  color: Colors.white,
                                                )
                                              : null,
                                        ),
                                      ),
                                      // Agree to our Terms & Stuff
                                      RichText(
                                        text: TextSpan(
                                            text: 'Agree to our  ',
                                            style: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: Color.fromRGBO(
                                                  136, 136, 136, 0.6),
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'Terms & Stuff',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0.8),
                                                    fontSize: 16,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    decorationColor:
                                                        Color.fromRGBO(
                                                            0, 0, 0, 0.3),
                                                    decorationThickness: 2,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 1.1),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () =>
                                                          Navigator.pushNamed(
                                                              context,
                                                              "/Signup"),
                                              ),
                                            ]),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 20,
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(25, .0, 25, 15),
                            child: RaisedButton(
                              onPressed: () => Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new Travel()),
                                  ModalRoute.withName("/Travel")),
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
                                    'Sign up',
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
                      child: _include.buildDivider(),
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
                            text: 'Already a member? ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(225, 122, 152, 1.0),
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Sign in',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.1),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () =>
                                      Navigator.pushNamed(context, "/Signin"),
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
