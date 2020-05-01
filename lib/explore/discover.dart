// Essential Flutter packages
import 'package:atlas/inc/include.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover>
    with SingleTickerProviderStateMixin {
  Include _include = new Include();
  TabController _tabController;
  List<String> discoverImages;
  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);

  void _addDiscoverImages() {
    discoverImages = List<String>();

    discoverImages.add(
        "${_include.imagesPath}discover_bg.gif");
    discoverImages.add(
        "${_include.imagesPath}discover_bg.gif");
    discoverImages.add(
        "${_include.imagesPath}discover_bg.gif");
    discoverImages.add(
        "${_include.imagesPath}discover_bg.gif");
    discoverImages.add(
        "${_include.imagesPath}discover_bg.gif");
    discoverImages.add(
        "${_include.imagesPath}discover_bg.gif");
    discoverImages.add(
        "${_include.imagesPath}discover_bg.gif");
    discoverImages.add(
        "${_include.imagesPath}discover_bg.gif");
  }
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _addDiscoverImages();
    return Scaffold(
        backgroundColor: Color(0xffd5d5d5),
        appBar: buildAppBar(),
        body: SafeArea(
          child: Stack(children: <Widget>[
            Stack(children: <Widget>[
              Container(
                  child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: discoverImages.length,
                      onPageChanged: (index) {
                        _pageViewNotifier.value = index;
                      },
                      itemBuilder: (context, index) {
                        return Stack(children: <Widget>[

                          // image layer
                          Container(
                              height: MediaQuery.of(context).size.height * 0.35,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: ExactAssetImage(
                                          discoverImages[index]),
                                      fit: BoxFit.cover))),

                          // black Opacity layer
                          Container(
                              height: MediaQuery.of(context).size.height * 0.35,
                              decoration: BoxDecoration(
                                  color: Colors.black54.withOpacity(0.40))),

                          // Price layer
                          Positioned(
                              left: MediaQuery.of(context).size.width * 0.05,
                              bottom: MediaQuery.of(context).size.height * 0.75,
                              child: Text("\$967",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.40),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500))),

                          // Small Dot
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.19,
                            bottom: MediaQuery.of(context).size.height * 0.76,
                            child: Container(
                                height: 5,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 3.0,
                                        color:
                                            Colors.white.withOpacity(0.40))))),

                          // Destination layer
                          Positioned(
                              left: MediaQuery.of(context).size.width * 0.22,
                              bottom: MediaQuery.of(context).size.height * 0.75,
                              child: Text('Tenessey',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.40),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500))),

                          // Description layer
                          Positioned(
                              right: 0,
                              left: MediaQuery.of(context).size.width * 0.05,
                              bottom: MediaQuery.of(context).size.height * 0.66,
                              child: Text(
                                  "An exquisite trip you'll rave about to your friends  ",
                                  maxLines: 2,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w500))),

                        ]);
                      }))]),

            //Get access Button
            Positioned(
                width: 160,
                height: 50,
                left: MediaQuery.of(context).size.width * 0.05,
                bottom: MediaQuery.of(context).size.height * 0.58,
                child: RaisedButton(
                    onPressed: () {},
                    color: Color(0xffd5d5d5),
                    shape: RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.circular(50.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Get access',
                            style: TextStyle(
                                color: Color(0xff393939),
                                letterSpacing: 1.4,
                                fontSize: 17)),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: Color(0xff393939).withOpacity(0.40),
                        ),
                      ],
                    ))),

            // Display Indicator
            //TODO:: Fix page indicator to change  with image changing
            Positioned(
                child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.62),
                    child: Transform.translate(
                        offset: Offset(0, 175),
                        child: Align(
                          alignment: Alignment.center,
                          child: displayPageIndicators(discoverImages.length ),
                        )))),

            // Featured Section
            Positioned(
              bottom: MediaQuery.of(context).size.height / 2.40,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Featured",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 6,
                      ),
                      FlatButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)
                          ),
                          child: Ink(
                            decoration: BoxDecoration(
                              gradient: _include.appGradientColor,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child:Container(
                              constraints: BoxConstraints(
                                maxWidth: 130.0,
                                minHeight: 50.0
                              ),
                              child:  Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('See all',
                                        style: TextStyle(
                                            color: Color(0xffd5d5d5),
                                            letterSpacing: 1.4,
                                            fontSize: 17)),
                                    SizedBox(width: 5,),
                                    Icon(Icons.arrow_forward_ios,
                                        size: 19,
                                        color:
                                        Color(0xffd5d5d5).withOpacity(0.60))
                                  ]),
                            )
                          ))
                    ]),
              ),
            ),

            // Card Section
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(80),
                      topLeft: Radius.circular(80),
                  )
                ),
                child: Stack(

                  children: <Widget>[
                    // Featured Title and Button
                    SizedBox(
                      height: 22,
                    ),
                    SingleChildScrollView(
                      child: Wrap(
                        verticalDirection: VerticalDirection.down,
                        textDirection: TextDirection.ltr,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        alignment: WrapAlignment.start,
                        children: <Widget>[

                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.05,
                            child: _placeCard(
                              image: 'discover_bg.gif',
                              imageSemanticLabel: null,
                              title: 'Red Ballet',
                              price: 967,
                              cityName: 'New York',
                              weatherImage: 'sun.png',
                              weatherImageSemanticLabel: null,
                              tempreture: 22,
                              weather: 'Sunny',
                              reactions: 4,
                              cardHeight: 300,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.05,
                            child: _placeCard(
                              image: 'discover_bg.gif',
                              imageSemanticLabel: null,
                              title: 'Red Ballet',
                              price: 967,
                              cityName: 'New York',
                              weatherImage: 'sun.png',
                              weatherImageSemanticLabel: null,
                              tempreture: 22,
                              weather: 'Sunny',
                              reactions: 4,
                              cardHeight: 300,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.05,
                            child: _placeCard(
                              image: 'discover_bg.gif',
                              imageSemanticLabel: null,
                              title: 'Red Ballet',
                              price: 967,
                              cityName: 'New York',
                              weatherImage: 'sun.png',
                              weatherImageSemanticLabel: null,
                              tempreture: 22,
                              weather: 'Sunny',
                              reactions: 4,
                              cardHeight: 300,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.05,
                            child: _placeCard(
                              image: 'discover_bg.gif',
                              imageSemanticLabel: null,
                              title: 'Red Ballet',
                              price: 967,
                              cityName: 'New York',
                              weatherImage: 'sun.png',
                              weatherImageSemanticLabel: null,
                              tempreture: 22,
                              weather: 'Sunny',
                              reactions: 4,
                              cardHeight: 300,
                            ),
                          ),

                        ]))]),
              )),
          ])));
  }

  // Discover App Bar
  AppBar buildAppBar() {
    return AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Color(0xffd5d5d5),

          // AppBar bottom border

          bottom: TabBar(
            unselectedLabelColor: Color(0xff393939).withOpacity(0.30),
            labelColor: Color(0xff393939),
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                    width: 5.0,
                    color: Color(0xffd64680),
                    style: BorderStyle.solid),
                insets: EdgeInsets.symmetric(horizontal: 20.0)),
            tabs: [
              Tab(
                  child: Text('DISCOVER',
                      style: TextStyle(
                          letterSpacing: 1.7, fontWeight: FontWeight.w600))),
              Tab(
                  child: Text('ACTIVITIES',
                      style: TextStyle(
                          letterSpacing: 1.7, fontWeight: FontWeight.w600))),
            ],
            controller: _tabController,
          ),
          // Aside menu (Drawer)
          leading: Padding(
            padding: EdgeInsets.only(left: 5),
            child: GestureDetector(
              onTap: () {},
//                  Scaffold.of(context).openDrawer(),
              child: Image.asset("assets/images/sidelist.png",
                  scale: _include.appBarButtonsImagesScale,
                  semanticLabel: "Aside menu"),
            ),
          ),
          // Title
          title: Padding(
            padding: EdgeInsets.only(top: 3),
            child: Text('Explore',
                style: TextStyle(
                    color: Color(0xff393939),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2)),
          ),
          centerTitle: true,
          actions: <Widget>[
            // Activity (Notifcations)
            GestureDetector(
                onTap: () {},
                child: Container(
                    child: Column(
                        mainAxisAlignment: _include.newActivity
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.center,
                        children: <Widget>[
                      // Bell
                      Image.asset("assets/images/activity.png",
                          scale: _include.appBarButtonsImagesScale,
                          semanticLabel: "Activity (Notifcations)"),

                      // New activity
                      _include.hasActivity(Color(0xffd64680))
                    ]))),

            // Search
            Padding(
              padding: EdgeInsets.only(right: 5, left: 8),
              child: GestureDetector(
                  onTap: () {},
                  child: Image.asset("assets/images/search.png",
                      scale: _include.appBarButtonsImagesScale,
                      semanticLabel: "Search")),
            )
          ]);
  }
  // Card description
  Text _cardDescriptionInfo(String title) {
    return Text(title,
        style: TextStyle(
            color: Colors.black54,
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 0));
  }
  // Page Indicator
  Widget displayPageIndicators(int length) {
    ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);
    return Container(
        width: MediaQuery.of(context).size.width * 0.40,
        height: MediaQuery.of(context).size.width * 0.07,
        decoration: BoxDecoration(
            color: Colors.black54.withOpacity(0.30),
            borderRadius: BorderRadius.circular(30.0)),
        child: PageViewIndicator(
            indicatorPadding: EdgeInsets.all(3),
            pageIndexNotifier: _pageViewNotifier,
            length: length,
            normalBuilder: (animationController, index) => Circle(
              size: 9.0,
              color: Colors.grey.withOpacity(0.50),
            ),
            highlightedBuilder: (animationController, index) => ScaleTransition(
                scale: CurvedAnimation(
                  parent: animationController,
                  curve: Curves.ease,
                ),
                child: Circle(
                  size: 9.0,
                  color: Colors.white,
                ))));
  }
  // Card widget
  Widget _placeCard(
      {@required String image,
      @required String imageSemanticLabel,
      @required String title,
      @required num price,
      @required String cityName,
      @required String weatherImage,
      @required String weatherImageSemanticLabel,
      @required int tempreture,
      @required String weather,
      @required double cardHeight,
      int reactions = 0,
     }) {
    int _bigNumber = 4;
    return // Entry point
        Container(
            height: cardHeight,
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.all(7), // here's the margin
                elevation: 2,
                child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(children: <Widget>[
                      // Banner
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                                "${_include.imagesPath}/" + image,
                                width: 200,
                                height: 100,
                                fit: BoxFit.cover,
                                semanticLabel: imageSemanticLabel),
                          )),

                      // Description
                      Container(
                          margin: EdgeInsets.only(bottom: 11),
                          padding: EdgeInsets.fromLTRB(5, 15, 4, 12),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                      // Title
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 2),
                                        child: Text(title,
                                            maxLines: 2,
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 1.15))),

                                      // Info
                                      Row(children: <Widget>[
                                        Wrap(
                                            crossAxisAlignment:
                                                price.toString().length >
                                                        _bigNumber
                                                    ? WrapCrossAlignment.start
                                                    : WrapCrossAlignment.center,
                                            runAlignment: WrapAlignment.start,
                                            // alignment: WrapAlignment.end,
                                            direction: price.toString().length >
                                                    _bigNumber
                                                ? Axis.vertical
                                                : Axis.horizontal,
                                            children: <Widget>[
                                              // Price
                                              _cardDescriptionInfo(
                                                  '\$' + price.toString()),

                                              // Dot (pharse)
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 3, 10, 0),
                                                child: Image.asset(
                                                    "${_include.imagesPath}/dot_grey.png",
                                                    scale: 2.5,
                                                    semanticLabel:
                                                        "Dot (pharse)"),
                                              ),

                                              // distance
                                              _cardDescriptionInfo(cityName),
                                            ])])])),

                                // More...
                                Padding(
                                  padding: EdgeInsets.only(top: 1.0),
                                  child: GestureDetector(
                                    onTap: () => print("#more"),
                                    child: Image.asset(
                                        "${_include.imagesPath}/more.png",
                                        scale: 2.2,
                                        semanticLabel: "Dots (more)"),
                                  ))])),

                      // Extra description
                      Container(
                          margin: EdgeInsets.only(top: 11),
                          child: Row(children: <Widget>[
                            Row(children: <Widget>[
                              // Weather image
                              Padding(
                                padding: EdgeInsets.only(right: 4),
                                child: Image.asset(
                                    "${_include.imagesPath}/$weatherImage",
                                    scale: 2.5,
                                    semanticLabel: weatherImageSemanticLabel)),

                              // Tempreture
                              RichText(
                                  text: TextSpan(
                                      text: tempreture.toString() + "°\n",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Montserrat"),
                                      children: <InlineSpan>[
                                    TextSpan(
                                        text: weather,
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1))]
                                  ))]),

                            // Reactions
                            Expanded(
                                child: Column(children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(bottom: 12),
                                child: Divider(
                                    height: 3,
                                    thickness: 3,
                                    color: Color.fromRGBO(204, 204, 204, 1)),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(right: 5),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        // Love icon
                                        Padding(
                                          padding: EdgeInsets.only(left: 12, right: 5),
                                          child: Image.asset(
                                              "${_include.imagesPath}/love.png",
                                              scale: 2.2,
                                              semanticLabel: "Love")),

                                        // Reactions count
                                        Text(
                                          reactions.toString() + 'k',
                                          style:
                                              TextStyle(color: Colors.black54)),

                                        // Seprator - Is that ok?! i think this way is wrong -
                                        Padding(
                                            padding: EdgeInsets.only(
                                                right: 7, left: 7))]))
                            ]))
                          ]))
                    ]))));
  }
}
