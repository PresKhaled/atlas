// Essential Flutter packages

import 'dart:ui';
import 'package:atlas/inc/include.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';



class Hotel extends StatefulWidget {
  @override
  _HotelState createState() => _HotelState();
}

class _HotelState extends State<Hotel> {
  Include _include = new Include();
  List<String> hotelImages;
  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);
  void _addHotelImages() {
    
    hotelImages = List<String>();

    hotelImages.add(
      "${_include.imagesPath}hotel_bg_img.gif",
    );
    hotelImages.add(
      "${_include.imagesPath}hotel_bg_img.gif",
    );
    hotelImages.add(
      "${_include.imagesPath}hotel_bg_img.gif",
    );
    hotelImages.add(
      "${_include.imagesPath}hotel_bg_img.gif",
    );
    hotelImages.add(
      "${_include.imagesPath}hotel_bg_img.gif",
    );
    hotelImages.add(
      "${_include.imagesPath}hotel_bg_img.gif",
    );
    hotelImages.add(
      "${_include.imagesPath}hotel_bg_img.gif",
    );
    hotelImages.add(
      "${_include.imagesPath}hotel_bg_img.gif",
    );
  }

  @override
  Widget build(BuildContext context) {
    _addHotelImages();

    return Stack(
      children: <Widget>[
        PageView.builder(
          scrollDirection: Axis.horizontal,
          pageSnapping: true,
          itemBuilder: (context, index) {
            return Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.70,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage(
                        hotelImages[index],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            );
          },
          itemCount: hotelImages.length,
          onPageChanged: (index) {
            setState(() {
              _pageViewNotifier.value = index;
            });
          },
        ),
        Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.45),
          child: Transform.translate(
            offset: Offset(0, 175),
            child: Align(
              alignment: Alignment.center,
              child: _displayPageIndicators(hotelImages.length),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close),
                color: Colors.white,
              ),
              actions: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.today),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert),
                  color: Colors.white,
                ),
              ],
            ),
            floatingActionButton: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.36),
              child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.bookmark_border,
                    color: Colors.pink,
                  )),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            body: SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.39,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Mt. Catlin Hotel',
                        style: _include.hotelNameStyle,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            '\$967',
                            style: _include.priceAndCityNameStyle,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'New York',
                            style: _include.priceAndCityNameStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _include.buildDivider(
                        Color(0xffd5d5d5).withOpacity(0.40),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'ABOUT MT. CATLIN',
                        style: _include.aboutHotelStyle,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
                        ' sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                        'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut',
                        style: _include.aboutHotelContentStyle,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: <Widget>[
                          ImageIcon(
                            AssetImage('${_include.imagesPath}sun.png'),
                            color: Color(0xffd5d5d5),
                            size: 45,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                '22',
                                style: _include.cityTemperatureStyle,
                              ),
                              Text(
                                'Sunny',
                                style: _include.cityWeatherStyle,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('|', style: _include.linearSeparatorStyle),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    '8.4',
                                    style: _include.hotelVotesRateStyle,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '+6k Votes',
                                    style: _include.totalVotesStyle,
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  _include.votesStarsOutofFive(_include.votesStarsColor, 0.99),
                                  _include.votesStarsOutofFive(_include.votesStarsColor, 0.99),
                                  _include.votesStarsOutofFive(_include.votesStarsColor, 0.99),
                                  _include.votesStarsOutofFive(_include.votesStarsColor, 0.40),
                                  _include.votesStarsOutofFive(_include.votesStarsColor, 0.40),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _displayPageIndicators(int length) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      height: MediaQuery.of(context).size.width * 0.05,
      decoration: BoxDecoration(
          color: Colors.black54.withOpacity(0.30),
          borderRadius: BorderRadius.circular(30.0)),
      child: PageViewIndicator(
        indicatorPadding: EdgeInsets.all(3),
        pageIndexNotifier: _pageViewNotifier,
        length: length,
        normalBuilder: (animationController, index) => Circle(
          size: 9.0,
          color: Colors.grey,
        ),
        highlightedBuilder: (animationController, index) => ScaleTransition(
          scale: CurvedAnimation(
            parent: animationController,
            curve: Curves.ease,
          ),
          child: Circle(
            size: 9.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
