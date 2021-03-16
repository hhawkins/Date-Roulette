import 'package:flutter/material.dart';

// class MatchCard {
//   int redColor = 0;
//   int greenColor = 0;
//   int blueColor = 0;
//   double margin = 0;
//   MatchCard(int red, int green, int blue, double marginTop) {
//     redColor = red;
//     greenColor = green;
//     blueColor = blue;
//     margin = marginTop;
//   }
// }

class ChamberCard extends StatelessWidget {
  ChamberCard({this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return new Card(
      color: Colors.transparent,
      elevation: 4.0,
      child: new Container(
        width: screenSize.width / 1.2,
        height: screenSize.height / 1.7,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(8.0),
        ),
        child: new Column(
          children: <Widget>[
            new Container(
              width: screenSize.width / 1.2,
              height: screenSize.height / 2.2,
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.only(
                    topLeft: new Radius.circular(8.0),
                    topRight: new Radius.circular(8.0)),
                //image: "images/logo.png",//img,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
