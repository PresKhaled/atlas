// Dart arms
import 'dart:ui';

// Essential Flutter packages
import 'package:flutter/material.dart';



// Useful methods, used globally
class Include {

  // Images Path
  String imagesPath = 'assets/images/';

  // Properties
  Color appPrimaryColor = Color.fromRGBO(233, 72, 109, 1);

  // Methods
  Size screenSize(BuildContext context, Window window) {
    return MediaQuery.of(context).size;
  }

  double statusBar(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  Divider buildDivider() {
    return Divider(
      thickness: 2.0,
      height: 2.0,
      color: Color.fromRGBO(225, 122, 152, 1.0),
    );
  }

  // Gradient Color
  Gradient appGradientColor = LinearGradient(
    colors: [Color.fromRGBO(193, 55, 111, 1), Color.fromRGBO(241, 120, 100, 1)],
    stops: [.2, 1],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  // Divider Color and Height
  Color _orDividerColor = Color.fromRGBO(225, 122, 152, 1.0);
  double _orDividerHeightThickness = 2.0;

  // Box Shadow
  List<BoxShadow> addShadowToWidget = <BoxShadow>[
    BoxShadow(
        offset: Offset(0, 20),
        color: Color.fromRGBO(0, 0, 0, .2),
        spreadRadius: -1,
        blurRadius: 15)
  ];


}








