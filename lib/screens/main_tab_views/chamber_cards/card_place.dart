import 'dart:convert';

import 'package:Date_Roulette/components/rounded_button.dart';
import 'package:Date_Roulette/constants.dart';
import 'package:Date_Roulette/screens/main_tab_views/chamber_cards/card_detail.dart';
import 'package:flutter/material.dart';

// import "package:google_maps_webservice/places.dart";
import 'package:http/http.dart' as http;

// final kGoogleApiKey = "AIzaSyCqs1WuJw_CaNfLY7ndChXWBd6BJ38glTE";
// final _places = new GoogleMapsPlaces(
//     apiKey: kGoogleApiKey,
//     baseUrl: "https://www.google.com/maps/search/?api=1&parameters");

class Place {
  final String name;

  Place({
    this.name,
  });
}

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

class CardPlace extends StatelessWidget {
  const CardPlace({
    Key key,
    this.color = Colors.indigo,
    this.text = "Date Example",
  }) : super(key: key);
  final Color color;
  final String text;

  Future<Places> getGooglePlacesResponse() async {
    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=38.7818,77.0147&radius=300&type=seafood&key=AIzaSyCqs1WuJw_CaNfLY7ndChXWBd6BJ38glTE'
        // 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=AIzaSyCqs1WuJw_CaNfLY7ndChXWBd6BJ38glTE&location=-38.7818,77.0147&radius=1500&type=restaurant'
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

  // Future<PlacesSearchResponse> returnPlacesSearchResponse() async {
  //   PlacesSearchResponse response =
  //       await _places.searchNearbyWithRadius(Location(31.0424, 42.421), 100);

  //   return response;
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height - (150 * 2),
      width: width - (38 * 2),

      // Warning: hard-coding values like this is a bad practice
      padding: EdgeInsets.all(38.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          width: 2.0,
          color: Colors.transparent.withOpacity(0.3),
        ),
      ),

      child: Column(
        children: [
          FutureBuilder(
            future: getGooglePlacesResponse(), //returnPlacesSearchResponse(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  child: Text(
                    snapshot.data.results[0]['name'],
                    style: TextStyle(
                      fontSize: 36.0,
                      // color: Colors.white,
                      color: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                throw snapshot.error;
              } else {
                return Container(
                  child: Text(
                    "Loading",
                    style: TextStyle(
                      fontSize: 36.0,
                      // color: Colors.white,
                      color: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                );
              }
            },
          ),
          Expanded(
            child: SizedBox(),
          ),
          RoundedButton(
            title: 'Details',
            color: kButtonSecondaryColor,
            textColor: kColorBlack,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CardDetailView()),
              );
            },
          ),
        ],
      ),
    );
  }
}
