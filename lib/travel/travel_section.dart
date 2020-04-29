// Essential Flutter packages
import 'package:flutter/material.dart';

// Internal resources
import '../inc/include.dart' show Include;
import '../inc/drawer.dart' as drawer;
import '../explore/activites.dart' show Activities;
import '../account/bookmarks.dart' show Bookmarks;
import '../communication/messages.dart' show Messages;
import '../account/profile.dart' show Profile;

class TravelSection extends StatefulWidget {
  @override
  _TravelSectionState createState() => _TravelSectionState();
}

class _TravelSectionState extends State<TravelSection> {
  // Instances & Properties
  Include _inc = new Include();
  PageController _pagesController;
  int _currentBottomNavigationBarIndex = 0;

  @override
  void initState() {
    super.initState();
    // Initialize pages controller (PageView)
    _pagesController =
        new PageController(initialPage: _currentBottomNavigationBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    _inc.lightStatusBar();
    return Scaffold(
        drawer: drawer.sideDrawer(),
        // AppBar
        appBar: _inc.propperAppBar(
            context: context,
            // TODO: Fix indicator condition mistake
            title: _pagesController.hasClients ??
                    double.parse(_pagesController.position.toString()) ==
                        _currentBottomNavigationBarIndex.toDouble()
                ? _inc.appbarPagesTitles[_currentBottomNavigationBarIndex]
                : CircularProgressIndicator(),
            buttonsImagesColor: Colors.grey[800]),

        // BottomNavigationBar
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                _currentBottomNavigationBarIndex = index;
                _pagesController.animateToPage(index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              });
            },
            items:
                // TODO: Optimize this codes, icon active color, add new activity hint (dot)
                <BottomNavigationBarItem>[
              // Travelling button
              BottomNavigationBarItem(
                  title: Text("Travelling"),
                  icon: Image.asset("${_inc.imagesPath}/travels.png",
                      scale: 2.5, semanticLabel: "Travelling")),

              // Explore button
              BottomNavigationBarItem(
                  title: Text("Explore"),
                  icon: Image.asset("${_inc.imagesPath}/explore.png",
                      scale: 2.5, semanticLabel: "Explore")),

              // Bookmarks button
              BottomNavigationBarItem(
                  title: Text("Saved"),
                  icon: Image.asset("${_inc.imagesPath}/saved.png",
                      scale: 2.5, semanticLabel: "Bookmarks (Saved)")),

              // Messages button
              BottomNavigationBarItem(
                  title: Text("Messages"),
                  icon: Image.asset("${_inc.imagesPath}/messages.png",
                      scale: 2.5, semanticLabel: "Messages")),

              // Profile button
              BottomNavigationBarItem(
                  title: Text("Profile"),
                  icon: Image.asset("${_inc.imagesPath}/profile.png",
                      scale: 2.5, semanticLabel: "Profile"))
            ],
            currentIndex: _currentBottomNavigationBarIndex),
        body: Container(
            child: Column(children: <Widget>[
          Expanded(
            child: PageView(
                onPageChanged: (index) {
                  setState(() {
                    _currentBottomNavigationBarIndex = index;
                  });
                },
                controller: _pagesController,
                children: <Widget>[
                  // Travel section
                  Container(child: Column(children: <Widget>[])),

                  //Explore: Activities (default)
                  Activities(),

                  // Bookmarks (Saved)
                  Bookmarks(),

                  // Messages
                  Messages(),

                  // Profile
                  Profile()
                ]),
          )
        ])));
  }
}
