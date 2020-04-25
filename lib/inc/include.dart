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
  Color appGradientPink = Color.fromRGBO(193, 55, 111, 0.9);
  Color appGradientLightPink = Color.fromRGBO(241, 120, 100, 0.9);
  Color votesStarsColor = Color(0xffcaa05f);

  // Methods
  Size screenSize(BuildContext context, Window window) {
    return MediaQuery.of(context).size;
  }

  double statusBar(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  Divider buildDivider(Color color) {
    return Divider(
      thickness: 2.0,
      height: 2.0,
      color: color,
    );
  }

  Widget votesStarsOutofFive(Color color , double opacity){
        return Icon(
          Icons.star,
          color: color.withOpacity(opacity),
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

  // TEXT STYLE ///////////////////////////

  // Text Colors
  static Color darkGrayColor =  Color(0xff535353);
  static Color grayColor =  Color(0xff888888);
  static Color lightGrayColor =  Color(0xffd5d5d5);

  // Font Family
  static String appFontFamily = "Montserrat";

  // Font Weight
  static FontWeight w500 = FontWeight.w500;
  static FontWeight w600 = FontWeight.w600;

  TextStyle hotelNameStyle = TextStyle(
    color: darkGrayColor,
    fontSize: 25,
    fontWeight: w600,
    fontFamily: appFontFamily,
  );

  TextStyle priceAndCityNameStyle = TextStyle(
    color: darkGrayColor,
    fontSize: 18,
    fontWeight: w500,
    fontFamily: appFontFamily,
  );

  TextStyle aboutHotelStyle = TextStyle(
    letterSpacing: 1.2,
    color: darkGrayColor,
    fontFamily: appFontFamily,
    fontSize: 15,
    fontWeight: w600,
  );

  TextStyle aboutHotelContentStyle =  TextStyle(
    color: darkGrayColor,
    fontFamily: appFontFamily,
    fontSize: 14,
    letterSpacing: 0.80,
  );

  TextStyle cityTemperatureStyle = TextStyle(
    fontSize: 28,
    fontWeight: w600,
    color: darkGrayColor,
  );

  TextStyle  cityWeatherStyle = TextStyle(
    color: grayColor,
  );

  TextStyle linearSeparatorStyle = TextStyle(
    fontSize: 45,
    color: lightGrayColor.withOpacity(0.40),
  );

  TextStyle hotelVotesRateStyle = TextStyle(
    fontSize: 28,
    fontFamily: appFontFamily,
    fontWeight: w600,
    color: darkGrayColor,
  );

  TextStyle totalVotesStyle = TextStyle(
    color: grayColor,
  );

// End TEXT STYLE ///////////////////////////

}








