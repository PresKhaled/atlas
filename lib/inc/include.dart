// Dart arms
import 'dart:ui';

// Essential Flutter packages
import 'package:flutter/material.dart';

// External resources (packages)
import 'package:meta/meta.dart';

// Internal resources
//import 'drawer.dart' as aside_menu;

// Useful methods, used globally
class Include {
  // Properties
  Color appPrimaryColor = Color.fromRGBO(233, 72, 109, 1);
  Color appGradientPink = Color.fromRGBO(193, 55, 111, 0.9);
  Color appGradientLightPink = Color.fromRGBO(241, 120, 100, 0.9);
  String imagesPath = 'assets/images';
  double _appBarButtonsImagesScale = 3.0;
  bool _newActivity = true;
  Color votesStarsColor = Color(0xffcaa05f);

  // Methods

  // Screen size, must use with 'dart:ui' import
  Size screenSize(BuildContext context, Window window) {
    return MediaQuery.of(context).size;
  }

  // Statusbar height
  double statusBar(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  // Check wether has a new activity or not, to append bell dot
  _hasActivity() {
    return _newActivity
        ? Padding(
            padding: EdgeInsets.only(top: 7, bottom: 6),
            child: Image.asset("assets/images/dot.png",
                scale: _appBarButtonsImagesScale,
                semanticLabel: "New Activity (Notifcations)"),
          )
        : Container();
  }

  AppBar propperAppBar(
      {@required String title,
      bool travel = false,
      @required BuildContext context}) {
    return AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: travel ? Colors.transparent : Colors.blueAccent,
        flexibleSpace: Container(
            decoration: BoxDecoration(
                // AppBar gradient
                gradient: travel
                    ? LinearGradient(
                        colors: [appGradientPink, appGradientLightPink],
                        stops: [0, 0],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight)
                    : LinearGradient(colors: []))),

        // AppBar bottom border
        bottom: PreferredSize(
            preferredSize: Size.zero,
            child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 2,
                            color: Color.fromRGBO(255, 255, 255, .1)))))),

        // Aside menu (Drawer)
        leading: Padding(
          padding: EdgeInsets.only(left: 5),
          child: GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Image.asset("assets/images/sidelist.png",
                scale: _appBarButtonsImagesScale, semanticLabel: "Aside menu"),
          ),
        ),

        // Title
        title: Padding(
          padding: EdgeInsets.only(top: 3),
          child: Text(title,
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 2)),
        ),
        centerTitle: true,
        actions: <Widget>[
          // Activity (Notifcations)
          GestureDetector(
              onTap: () {},
              child: Container(
                  child: Column(
                      mainAxisAlignment: _newActivity
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.center,
                      children: <Widget>[
                    // Bell
                    Image.asset("assets/images/activity.png",
                        scale: _appBarButtonsImagesScale,
                        semanticLabel: "Activity (Notifcations)"),

                    // New activity
                    _hasActivity()
                  ]))),

          // Search
          Padding(
            padding: EdgeInsets.only(right: 5, left: 8),
            child: GestureDetector(
                onTap: () {},
                child: Image.asset("assets/images/search.png",
                    scale: _appBarButtonsImagesScale, semanticLabel: "Search")),
          )
        ]);
      }
    Divider buildDivider(Color color) {
      return Divider(
        thickness: 2.0,
        height: 2.0,
        color: color,
      );
    }

    Widget votesStarsOutofFive(Color color, double opacity) {
      return Icon(
        Icons.star,
        color: color.withOpacity(opacity),
      );
    }

    // Gradient Color
    Gradient appGradientColor = LinearGradient(
      colors: [
        Color.fromRGBO(193, 55, 111, 1),
        Color.fromRGBO(241, 120, 100, 1)
      ],
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
    static Color darkGrayColor = Color(0xff535353);
    static Color grayColor = Color(0xff888888);
    static Color lightGrayColor = Color(0xffd5d5d5);

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

    TextStyle aboutHotelContentStyle = TextStyle(
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

    TextStyle cityWeatherStyle = TextStyle(
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
