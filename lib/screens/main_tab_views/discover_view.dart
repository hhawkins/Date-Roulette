import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:swipeable_card/swipeable_card.dart';

import '../../constants.dart';
import 'chamber_cards/card_example.dart';
import 'chamber_cards/card_place.dart';

import 'package:http/http.dart' as http;

class Places {
  final List<dynamic> results;

  Places({
    this.results,
  });

  factory Places.fromJson(Map<String, dynamic> json) {
    return Places(
      results: json['results'],
    );
  }
}

class DiscoverView extends StatefulWidget {
  static const String id = 'chamber_view';

  @override
  _DiscoverViewState createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  Future myFuture;

  @override
  void initState() {
    // super.initState();
    myFuture = getGooglePlacesResponse();
  }

  Future<Places> getGooglePlacesResponse() async {
    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
            'location=38.7818,-77.0147'
            '&radius=1500'
            '&keyword=restaurant'
            '&key=AIzaSyCqs1WuJw_CaNfLY7ndChXWBd6BJ38glTE'
        ));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Places.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load results');
    }
  }

  final List<CardExample> cards = [
    // CardExample(color: Colors.red, text: "First date"),
    // CardExample(color: Colors.blue, text: "Second date"),
    // CardExample(color: Colors.orange),
    // CardExample(color: Colors.indigo),
    // CardExample(color: Colors.green, text: "The next card is the last date"),
    // CardExample(color: Colors.purple, text: "This is the last date"),
  ];
  int currentCardIndex = 0;


  @override
  Widget build(BuildContext context) {
    SwipeableWidgetController _cardController = SwipeableWidgetController();
    bool alreadyChecked = false;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/roulette wheel table.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: FutureBuilder(
              future: myFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (!alreadyChecked) {
                    for (var place in snapshot.data.results) {
                      cards.add(CardExample(
                        color: Colors.red,
                        text: place['name'],
                        photoReference: place['photos'][0]['photo_reference'],
                        maxHeight: 600,
                        maxWidth: 400,
                      ));
                    }

                    alreadyChecked = true;
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      if (currentCardIndex < cards.length)
                        buildSwipeableWidget(snapshot.data)
                      else
                        // if the deck is complete, add a button to reset deck
                        Center(
                          child: FlatButton(
                            child: Text("Reset deck"),
                            onPressed: () =>
                                setState(() => currentCardIndex = 0),
                          ),
                        ),
                      // only show the card controlling buttons when there are cards
                      // otherwise, just hide it
                      if (currentCardIndex < cards.length)
                        cardControllerRow(_cardController),
                    ],
                  );
                } else if (snapshot.hasError) {
                  throw snapshot.error;
                } else {
                  return Container(
                    child: Text(
                      "Loading",
                      style: TextStyle(
                        fontSize: 36.0,
                        color: Colors.white.withOpacity(0.8),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }

  Widget buildSwipeableWidget(Places results) {
    if (Platform.isAndroid) {
      return SwipeableWidget(
        key: ObjectKey(currentCardIndex),
        child: cards[currentCardIndex],
        onLeftSwipe: () => swipeLeft(),
        onRightSwipe: () => swipeRight(),
        nextCards: <Widget>[
          // show next card
          // if there are no next cards, show nothing
          if (!(currentCardIndex + 1 >= cards.length))
            Align(
              alignment: Alignment.center,
              child: cards[currentCardIndex + 1],
            ),
        ],
      );
    } else if (Platform.isIOS) {
      return SwipeableWidget(
        key: ObjectKey(currentCardIndex),
        child: cards[currentCardIndex],
        onLeftSwipe: () => swipeLeft(),
        onRightSwipe: () => swipeRight(),
        nextCards: <Widget>[
          // show next card
          // if there are no next cards, show nothing
          if (!(currentCardIndex + 1 >= cards.length))
            Align(
              alignment: Alignment.center,
              child: cards[currentCardIndex + 1],
            ),
        ],
      );
    }
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
