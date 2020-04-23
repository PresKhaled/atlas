import 'package:flutter/material.dart';

ListTile sideDrawerItem({IconData icon, String itemName, Function onPressed}) {
  return ListTile(
    title: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.grey[600],
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            itemName,
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
    onTap: onPressed,
  );
}

Drawer sideDrawer() {
  return Drawer(
    elevation: 10,
    child: ListView(
      children: <Widget>[
        DrawerHeader(
          child: Center(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5.0),
                    decoration: BoxDecoration(boxShadow: <BoxShadow>[
                      BoxShadow(
                          offset: Offset(0, 5),
                          color: Color.fromRGBO(0, 0, 0, .2),
                          spreadRadius: 1,
                          blurRadius: 10)
                    ]),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset("assets/images/profile-photo.png")),
                  ),
                ),
                Text(
                  'Bernard Cerny',
                  style: TextStyle(
                      fontFamily: 'Montserrat', fontWeight: FontWeight.w600),
                ),
                Expanded(
                    child: Text(
                  'DJ/Traveler',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                )),
                Expanded(
                  child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                    ),
                    onPressed: () {},
                    color: Color(0xffE72E73),
                    textColor: Colors.white,
                    child: Text(
                      "Edit",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Color(0xffEBEBEB),
          ),
        ),
        sideDrawerItem(
            icon: Icons.explore, itemName: 'Discover', onPressed: () {}),
        sideDrawerItem(
            icon: Icons.near_me, itemName: 'Near me', onPressed: () {}),
        sideDrawerItem(
            icon: Icons.apps, itemName: 'Activites', onPressed: () {}),
        sideDrawerItem(icon: Icons.map, itemName: 'Map', onPressed: () {}),
        sideDrawerItem(
            icon: Icons.book, itemName: 'Bookings', onPressed: () {}),
        sideDrawerItem(
            icon: Icons.subscriptions,
            itemName: 'Subscription',
            onPressed: () {}),
        Divider(
          thickness: 2,
          endIndent: 55,
          indent: 55,
          color: Colors.grey[300],
        ),
        sideDrawerItem(
            icon: Icons.settings, itemName: 'Settings', onPressed: () {}),
        sideDrawerItem(
            icon: Icons.exit_to_app, itemName: 'Logout', onPressed: () {}),
      ],
    ),
  );
}
