// Dart arms
import 'dart:ui';

// Essential Flutter packages
import 'package:flutter/material.dart';

// External resources (packages)
import 'package:meta/meta.dart';

// Internal resources
import '../inc/include.dart' show Include;
import '../inc/drawer.dart' as aside_menu;
import 'travel_section.dart' show TravelSection;

class Travel extends StatefulWidget {
  @override
  _TravelState createState() => _TravelState();
}

class _TravelState extends State<Travel> {
  Include _inc = new Include();
  //String _currentSection;
  //Color _travelPrimaryColor = Color.fromRGBO(252, 172, 178, 1);
  static Color _cardSecondColor = Color.fromRGBO(85, 85, 85, 1);
  TextStyle _reactionTextStyle = TextStyle(
      color: _cardSecondColor, fontWeight: FontWeight.w600, letterSpacing: 2);
  int _bigNumber = 4;

  // Global text shadow values
  List<Shadow> _travelPrimaryTextShadow = [
    Shadow(color: Colors.black12, blurRadius: 5)
  ];

  // Card Description info (after title)
  Text _cardDescriptionInfo(String title) {
    return Text(title,
        style: TextStyle(
            color: _cardSecondColor,
            fontSize: 13,
            fontWeight: FontWeight.w600,
            letterSpacing: 1));
  }

  // Place card
  // TODO: Fix reactions big numbers space issue
  Widget _placeCard(
      {@required String image,
      @required String imageSemanticLabel,
      @required String descriptionTitle,
      @required num price,
      @required int distance,
      @required String weatherImage,
      @required String weatherImageSemanticLabel,
      @required int tempreture,
      @required String weather,
      String reactions = '0',
      int comments = 0,
      bool isFirst = false,
      bool isLast = false}) {
    return // Entry point
        Container(
            width: 330,
            // TODO: Create a propper BoxShadow
            child: SingleChildScrollView(
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    margin: isFirst
                        ? EdgeInsets.fromLTRB(30, 15, 15, 15)
                        : isLast
                            ? EdgeInsets.fromLTRB(15, 15, 30, 15)
                            : EdgeInsets.all(15), // here's the margin
                    elevation: 10,
                    child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(children: <Widget>[
                          // Banner
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: Colors.grey[300],
                                        blurRadius: 0,
                                        spreadRadius: -14,
                                        offset: Offset(0, 24)),
                                    BoxShadow(
                                        color: Colors.grey[400],
                                        blurRadius: 0,
                                        spreadRadius: -8,
                                        offset: Offset(0, 13))
                                  ]),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                    "${_inc.imagesPath}/" + image,
                                    width: 310,
                                    height: 160,
                                    fit: BoxFit.cover,
                                    semanticLabel: imageSemanticLabel),
                              )),

                          // Description
                          Container(
                              margin: EdgeInsets.only(bottom: 11),
                              padding: EdgeInsets.fromLTRB(8, 15, 8, 0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                          // Title
                                          Padding(
                                            padding: EdgeInsets.only(bottom: 2),
                                            child: Text(descriptionTitle,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 1.15)),
                                          ),

                                          // Info
                                          Row(children: <Widget>[
                                            Wrap(
                                                crossAxisAlignment: price
                                                            .toString()
                                                            .length >
                                                        _bigNumber
                                                    ? WrapCrossAlignment.start
                                                    : WrapCrossAlignment.center,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                // alignment: WrapAlignment.end,
                                                direction:
                                                    price.toString().length >
                                                            _bigNumber
                                                        ? Axis.vertical
                                                        : Axis.horizontal,
                                                children: <Widget>[
                                                  // Price
                                                  _cardDescriptionInfo(
                                                      '\$' + price.toString()),

                                                  // Dot (pharse)
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 3, 10, 0),
                                                    child: Image.asset(
                                                        "${_inc.imagesPath}/dot_grey.png",
                                                        scale: 2.5,
                                                        semanticLabel:
                                                            "Dot (pharse)"),
                                                  ),

                                                  // distance
                                                  _cardDescriptionInfo(
                                                      distance.toString() +
                                                          " Km away"),
                                                ])
                                          ])
                                        ])),

                                    // More...
                                    Padding(
                                      padding: EdgeInsets.only(top: 1.0),
                                      child: GestureDetector(
                                        onTap: () => print("#more"),
                                        child: Image.asset(
                                            "${_inc.imagesPath}/more.png",
                                            scale: 2.2,
                                            semanticLabel: "Dots (more)"),
                                      ),
                                    )
                                  ])),

                          // Extra description
                          Container(
                              margin: EdgeInsets.only(top: 11),
                              child: Row(children: <Widget>[
                                Row(children: <Widget>[
                                  // Weather image
                                  Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Image.asset(
                                        "${_inc.imagesPath}/$weatherImage",
                                        scale: 2.5,
                                        semanticLabel:
                                            weatherImageSemanticLabel),
                                  ),

                                  // Tempreture
                                  RichText(
                                      text: TextSpan(
                                          text: tempreture.toString() + "°\n",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Montserrat"),
                                          children: <InlineSpan>[
                                        TextSpan(
                                            text: weather,
                                            style: TextStyle(
                                                color: _cardSecondColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 1))
                                      ]))
                                ]),

                                // Reactions
                                Expanded(
                                    child: Column(children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 12),
                                    child: Divider(
                                        height: 3,
                                        thickness: 3,
                                        color:
                                            Color.fromRGBO(204, 204, 204, 1)),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(right: 5),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            // Love icon
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 8),
                                              child: Image.asset(
                                                  "${_inc.imagesPath}/love.png",
                                                  scale: 2.2,
                                                  semanticLabel: "Love"),
                                            ),

                                            // Reactions count
                                            Text(reactions,
                                                style: _reactionTextStyle),

                                            // Seprator - Is that ok?! i think this way is wrong -
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    right: 7, left: 7)),

                                            // Comment icon
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 8),
                                              child: Image.asset(
                                                  "${_inc.imagesPath}/comment.png",
                                                  scale: 2.2,
                                                  semanticLabel: "Comment"),
                                            ),

                                            // Comments count
                                            Text(comments.toString(),
                                                style: _reactionTextStyle)
                                          ]))
                                ]))
                              ]))
                        ])))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _inc.propperAppBar(
            context: context,
            title: "Travelling",
            titleColor: Colors.white,
            gradient: LinearGradient(
                colors: [_inc.appGradientPink, _inc.appGradientLightPink],
                stops: [0, 0],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight)),
        drawer: aside_menu.sideDrawer(),
        body: SingleChildScrollView(
            child: Container(
                height: _inc.screenSize(context, window).height,
                child: Column(children: <Widget>[
                  Expanded(
                      child: Stack(children: <Widget>[
                    // Gradient
                    Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                          _inc.appGradientPink,
                          _inc.appGradientLightPink
                        ],
                                stops: [
                          .2,
                          1
                        ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter))),

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
                                                  semanticLabel: "Expand list"))
                                        ])))
                          ])),

                      // Divider
                      Padding(
                        padding: EdgeInsets.only(right: 20, left: 20),
                        child: Divider(thickness: 1.5, color: Colors.white30),
                      ),

                      // Selected section results (hotels)
                      Container(
                          padding: EdgeInsets.fromLTRB(30, 15, 30, 30),
                          child: Column(children: <Widget>[
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  // Current section name or alias
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 7),
                                    child: Text("Featured",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1.5,
                                            shadows: _travelPrimaryTextShadow)),
                                  ),

                                  // Travel section Navigate
                                  RaisedButton(
                                      onPressed: () =>
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          TravelSection()),
                                              ModalRoute.withName("/")),
                                      child: Text("See all"))
                                ]),
                            // Place cards
                            Container(
                                height: 410, // 10 for margin below
                                padding: EdgeInsets.all(20),
                                child: OverflowBox(
                                    maxWidth:
                                        _inc.screenSize(context, window).width,
                                    child: Column(children: <Widget>[
                                      Expanded(
                                          child: ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: <Widget>[
                                            // Some place in California
                                            _placeCard(
                                                image: "california_hotel.png",
                                                imageSemanticLabel:
                                                    "California hotel",
                                                descriptionTitle:
                                                    "New York Art Me...",
                                                price: 999,
                                                distance: 257,
                                                weatherImage: "sun.png",
                                                weatherImageSemanticLabel:
                                                    "Sun",
                                                tempreture: 26,
                                                weather: "Sunny",
                                                reactions: "5K",
                                                comments: 766,
                                                isFirst: true),

                                            // Some place in New York
                                            _placeCard(
                                                image: "newyork_hotel.png",
                                                imageSemanticLabel:
                                                    "New York hotel",
                                                descriptionTitle:
                                                    "New York hotel",
                                                price: 850,
                                                distance: 34,
                                                weatherImage: "cloud.png",
                                                weatherImageSemanticLabel:
                                                    "Cloud",
                                                tempreture: 17,
                                                weather: "Cloudy",
                                                reactions: "4K",
                                                comments: 588),

                                            // Some place in Earth
                                            _placeCard(
                                                image: "placeholder_image.png",
                                                imageSemanticLabel:
                                                    "Placeholder Image",
                                                descriptionTitle:
                                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc venenatis tortor vel ultricies venenatis. Aliquam vehicula massa at aliquam convallis.",
                                                price: 999999999,
                                                distance: 999999999,
                                                weatherImage: "cloud.png",
                                                weatherImageSemanticLabel:
                                                    "Cloud",
                                                tempreture: 999999999,
                                                weather: "Cloudy",
                                                reactions: "999999999K",
                                                comments: 999999999),

                                            // Some place in California
                                            _placeCard(
                                                image: "chicago_hotel.png",
                                                imageSemanticLabel:
                                                    "Chicago hotel",
                                                descriptionTitle:
                                                    "Chicago hotel...",
                                                price: 780,
                                                distance: 48,
                                                weatherImage: "sun.png",
                                                weatherImageSemanticLabel:
                                                    "Sun",
                                                tempreture: 24,
                                                weather: "Sunny",
                                                reactions: "3k",
                                                comments: 418,
                                                isLast: true),
                                          ]))
                                    ])))
                          ]))
                    ]))
                  ]))
                ]))));
  }
}
