import 'package:flutter/material.dart';
import 'package:swipeable_card/swipeable_card.dart';

import 'chamber_cards/card_example.dart';

class MatchCard {
  int redColor = 0;
  int greenColor = 0;
  int blueColor = 0;
  double margin = 0;
  MatchCard(int red, int green, int blue, double marginTop) {
    redColor = red;
    greenColor = green;
    blueColor = blue;
    margin = marginTop;
  }
}

class ChamberView extends StatefulWidget {
  static const String id = 'chamber_view';

  @override
  _ChamberViewState createState() => _ChamberViewState();
}

class _ChamberViewState extends State<ChamberView> {
  List<Widget> cardList;

  @override
  void initState() {
    super.initState();
  }

  final List<CardExample> cards = [
    CardExample(color: Colors.red, text: "First date"),
    CardExample(color: Colors.blue, text: "Second date"),
    CardExample(color: Colors.orange),
    CardExample(color: Colors.indigo),
    CardExample(color: Colors.green, text: "The next card is the date"),
    CardExample(color: Colors.purple, text: "This is the last date"),
  ];
  int currentCardIndex = 0;

  @override
  Widget build(BuildContext context) {
    SwipeableWidgetController _cardController = SwipeableWidgetController();
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                if (currentCardIndex < cards.length)
                  SwipeableWidget(
                    key: ObjectKey(currentCardIndex),
                    child: cards[currentCardIndex],
                    onLeftSwipe: () => swipeLeft(),
                    onRightSwipe: () => swipeRight(),
                    //onTopSwipe: () => swipeTop(),
                    //onBottomSwipe: () => swipeBottom(),
                    nextCards: <Widget>[
                      // show next card
                      // if there are no next cards, show nothing
                      if (!(currentCardIndex + 1 >= cards.length))
                        Align(
                          alignment: Alignment.center,
                          child: cards[currentCardIndex + 1],
                        ),
                    ],
                  )
                else
                  // if the deck is complete, add a button to reset deck
                  Center(
                    child: FlatButton(
                      child: Text("Reset deck"),
                      onPressed: () => setState(() => currentCardIndex = 0),
                    ),
                  ),
                // only show the card controlling buttons when there are cards
                // otherwise, just hide it
                if (currentCardIndex < cards.length)
                  cardControllerRow(_cardController),
              ],
            )));
  }

  void swipeLeft() {
    print("left");

    // NOTE: it is your job to change the card
    setState(() => currentCardIndex++);
  }

  void swipeRight() {
    print("right");
    setState(() => currentCardIndex++);
  }

  void swipeTop() {
    print("top");
    setState(() => currentCardIndex++);
  }

  void swipeBottom() {
    print("top");
    setState(() => currentCardIndex++);
  }

  Widget cardControllerRow(SwipeableWidgetController cardController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        FlatButton(
          child: Text("Left"),
          onPressed: () => cardController.triggerSwipeLeft(),
        ),
        FlatButton(
          child: Text("Right"),
          onPressed: () => cardController.triggerSwipeRight(),
        ),
      ],
    );
  }
}
