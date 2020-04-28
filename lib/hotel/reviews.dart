// Essential Flutter packages
import 'package:flutter/material.dart';

// Internal resources
import '../inc/include.dart' show Include;

Include _include = new Include();
List<Widget> cardReviews = [];

//Row of the five stars
Row fiveStars() {
  return Row(
    children: <Widget>[
      _include.votesStarsOutofFive(_include.votesStarsColor, 0.99),
      _include.votesStarsOutofFive(_include.votesStarsColor, 0.99),
      _include.votesStarsOutofFive(_include.votesStarsColor, 0.99),
      _include.votesStarsOutofFive(_include.votesStarsColor, 0.40),
      _include.votesStarsOutofFive(_include.votesStarsColor, 0.40),
    ],
  );
}

//The Reviwed Item for the list
Container reviweItem() {
  return Container(
    color: Color(0xffFAFAFA),
    child: Column(
      children: <Widget>[
        //Reviwe Item
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: <Widget>[
              //User details
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //The user image
                  Expanded(
                    child: Container(
                      height: 60,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                              '${_include.imagesPath}/profile-photo.png')),
                    ),
                  ),

                  //User name , stars , votes
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //User Name
                        Text(
                          'Steven Gerrad',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),

                        //User rate (stars) and number of votes
                        Row(
                          children: <Widget>[
                            //The five stars
                            Container(
                                margin: EdgeInsets.only(right: 5),
                                child: fiveStars()),

                            //Number of user's votes
                            Expanded(
                              child: Text(
                                '(22 Votes)',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[600],
                                  letterSpacing: 1,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  //Review time
                  Expanded(
                    child: Text(
                      '52 min ago'.toUpperCase(),
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600],
                          letterSpacing: 2,
                          fontSize: 12),
                    ),
                  ),
                ],
              ),

              Divider(
                indent: 90,
                endIndent: 40,
                thickness: 2,
                height: 40,
                color: Colors.grey[300],
              ),

              //User Review
              Container(
                padding: EdgeInsets.only(left: 95, right: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    //Main user review
                    Text(
                      'Another Dimension!',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          letterSpacing: 1),
                    ),

                    //details user review
                    Text(
                      'Nunc justo eros, vehicula vel vehicula ut, lacina aerat. Nam fringilla eros...',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                          height: 1.5),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15),

              //Row for : like button , number of like  , more details
              Container(
                margin: EdgeInsets.only(left: 90, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    //The like button (Heart icon)
                    Container(
                      height: 20,
                      margin: EdgeInsets.only(right: 5),
                      child: GestureDetector(
                        onTap: () {},
                        child: Image.asset('${_include.imagesPath}/love.png'),
                      ),
                    ),

                    //Number of likes
                    Expanded(
                        child: Text(
                      '271',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                          height: 1.5),
                    )),

                    Spacer(flex: 5),

                    //More details button
                    Expanded(
                      child: IconButton(
                          icon: Icon(Icons.more_horiz), onPressed: () {}),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

        //The space under every item
        Container(height: 10, color: Color(0xffE3E3E3)),
      ],
    ),
  );
}

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
        backgroundColor: Color(0xffFAFAFA),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    fiveStars()
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
                            image: "${_include.imagesPath}/profile-photo.png")),

                    //USER #2
                    Positioned(
                        left: 20,
                        child: reviewUser(
                            image: "${_include.imagesPath}/profile-photo.png")),

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

          //The red bottom Line
          Divider(
            thickness: 4,
            color: Color(0xffF4327F),
            endIndent: 200,
            indent: 30,
          ),

          Container(height: 25, color: Color(0xffE3E3E3)),

          //List for Users's reviews
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Container(),
              itemCount: 3,
              itemBuilder: (context, index) => reviweItem(),
            ),
          )
        ],
      ),
    );
  }
}
