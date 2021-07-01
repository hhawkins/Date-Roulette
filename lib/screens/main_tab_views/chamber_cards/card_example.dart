import 'package:Date_Roulette/components/rounded_button.dart';
import 'package:Date_Roulette/constants.dart';
import 'package:Date_Roulette/screens/main_tab_views/chamber_cards/card_detail.dart';
import 'package:flutter/material.dart';

class CardExample extends StatelessWidget {
  const CardExample({
    Key key,
    this.color = Colors.indigo,
    this.text = "Date Example",
    this.photoReference = "",
    this.maxHeight = 400,
    this.maxWidth = 400,
  }) : super(key: key);
  final Color color;
  final String text;
  final String photoReference;
  final int maxHeight;
  final int maxWidth;

  String PlacePhotoRequest(
      {String key, String photoRefernce, int maxHeight, int maxWidth}) {
    return "https://maps.googleapis.com/maps/api/place/photo?" +
        "maxwidth=" +
        maxWidth.toString() +
        "&maxheight=" +
        maxHeight.toString() +
        "&photoreference=" +
        photoReference +
        "&key=" +
        key;
  }

  Image getCardImage(String photoReference, int maxHeight, int maxWidth) {
    //this will extract url to get photo
    String photoUrl = PlacePhotoRequest(
      key: 'AIzaSyCqs1WuJw_CaNfLY7ndChXWBd6BJ38glTE',
      photoRefernce: photoReference,
      maxHeight: maxHeight, //this value should be in 1~1600, default is 1600
      maxWidth: maxWidth, //this value should be in 1~1600, default is 1600
    );

    return Image.network(
      photoUrl, //"assets/images/subjects/api_given_image_name.png",
      width: 400,
      errorBuilder:
          (BuildContext context, Object exception, StackTrace stackTrace) {
        return Image.asset(
          'images/Date background example.jpg',
          width: 400,
        );
      },
    );

    // try {
    //   return AssetImage(photoUrl);
    // } catch (error) {
    //   return AssetImage('images/Date background example.jpg');
    // }
  }

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
        image: DecorationImage(
          image: getCardImage(photoReference, maxHeight, maxWidth).image,
          fit: BoxFit.cover,
        ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            //margin: const EdgeInsets.all(15.0),
            //padding: const EdgeInsets.all(35.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 32.0,
                fontFamily: 'MerriweatherBoldItalic',
                 color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
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
