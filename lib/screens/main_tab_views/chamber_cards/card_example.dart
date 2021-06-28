import 'package:Date_Roulette/components/rounded_button.dart';
import 'package:Date_Roulette/constants.dart';
import 'package:Date_Roulette/screens/main_tab_views/chamber_cards/card_detail.dart';
import 'package:flutter/material.dart';

class CardExample extends StatelessWidget {
  const CardExample({
    Key key,
    this.color = Colors.indigo,
    this.text = "Date Example",
  }) : super(key: key);
  final Color color;
  final String text;

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
          image: AssetImage('images/Date background example.jpg'),
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
                fontSize: 24.0,
                fontFamily: 'ZillaSlabHighlightBold',
                // color: Colors.white,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.w900,
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
