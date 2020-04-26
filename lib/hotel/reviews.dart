import 'package:atlas/inc/include.dart';
import 'package:flutter/material.dart';

Include _include = new Include();

//The left reviewed user circul
Widget reviewUser({String image = ''}) {
  image = '${_include.imagesPath}/profile-photo.png';
  return Container(
    height: 40,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(width: 3, color: Color(0xffF2F2F2))),
    child: ClipRRect(
        borderRadius: BorderRadius.circular(40.0), child: Image.asset(image)),
  );
}

class Reviews extends StatefulWidget {
  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xffF2F2F2),
        title: Text('Reviews',
            style: TextStyle(
                fontSize: 18,
                color: Color(0xff222222),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600)),
        leading: Container(
          margin: EdgeInsets.only(left: 20),
          child: IconButton(
            icon: Icon(
              Icons.close,
              size: 30,
              color: Color(0xff8A8A8A),
            ),
            onPressed: () {},
          ),
        ),
      ),
      body: Container(
        color: Color(0xffE3E3E3),
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0xffF2F2F2),
              child: Column(
                children: <Widget>[
                  //The top row {the rating and the left users}
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Spacer(flex: 1),
                      Expanded(
                        flex: 6,
                        child: Column(
                          children: <Widget>[
                            //Rating Numbers
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

                            //The Rating Stars
                            Row(
                              children: <Widget>[
                                _include.votesStarsOutofFive(
                                    _include.votesStarsColor, 0.99),
                                _include.votesStarsOutofFive(
                                    _include.votesStarsColor, 0.99),
                                _include.votesStarsOutofFive(
                                    _include.votesStarsColor, 0.99),
                                _include.votesStarsOutofFive(
                                    _include.votesStarsColor, 0.40),
                                _include.votesStarsOutofFive(
                                    _include.votesStarsColor, 0.40),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Spacer(flex: 1),

                      //The Right reviws Users
                      Expanded(
                        flex: 4,
                        child: Stack(
                          children: <Widget>[
                            //USER #3
                            Positioned(
                                left: 40,
                                child: reviewUser(
                                    image:
                                        "${_include.imagesPath}/profile-photo.png")),

                            //USER #2
                            Positioned(
                                left: 20,
                                child: reviewUser(
                                    image:
                                        "${_include.imagesPath}/profile-photo.png")),

                            //USER #1
                            Positioned(child: reviewUser()),

                            //Right icon for more users
                            Positioned(
                                left: 65,
                                bottom: 1,
                                top: 1,
                                child: IconButton(
                                    icon: Icon(Icons.arrow_forward_ios,
                                        color: Colors.grey[400], size: 20.0),
                                    onPressed: () {})),
                          ],
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 10),

                  //The red bottom Line
                  Divider(
                    thickness: 4,
                    color: Color(0xffF4327F),
                    endIndent: 200,
                    indent: 30,
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
