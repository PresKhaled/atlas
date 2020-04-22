// Dart arms
import 'dart:ui';

// Essential Flutter packages
import 'package:flutter/material.dart';

// Useful methods, used globally
class Include {
  // Properties
  Color appPrimaryColor = Color.fromRGBO(233, 72, 109, 1);

  // Methods
  Size screenSize(BuildContext context, Window window) {
    return MediaQuery.of(context).size;
  }

  double statusBar(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }
}
