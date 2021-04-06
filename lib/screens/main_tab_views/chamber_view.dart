import 'package:Date_Roulette/components/rounded_button.dart';
import 'package:Date_Roulette/constants.dart';
import 'package:Date_Roulette/screens/main_tab_views/chamber_cards/card_detail.dart';
import 'package:flutter/material.dart';

class ChamberView extends StatefulWidget {
  static const String id = 'chamber_view';

  @override
  _ChamberViewState createState() => _ChamberViewState();
}

class NewItem {
  bool isExpanded;
  final String header;
  final Widget body;
  final Icon iconpic;
  NewItem(this.isExpanded, this.header, this.body, this.iconpic);
}

class _ChamberViewState extends State<ChamberView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: ListWheelScrollView(
          itemExtent: 80.0,
          diameterRatio: 1.2,
          offAxisFraction: -0.7,
          // useMagnifier: true,
          // magnification: 1.5,
          children: [
            SizedBox(
              height: 100.0,
            ),
            /* The current implementation is a place holder
            eventually, we'd like to have a smooth setup for the cards like this
            https://github.com/2d-inc/HistoryOfEverything */
            buildChamberCard(
              context,
              "First Date",
              Colors.red,
            ),
            SizedBox(
              height: 10.0,
            ),
            buildChamberCard(
              context,
              "Second date",
              Colors.blue,
            ),
            SizedBox(
              height: 10.0,
            ),
            buildChamberCard(
              context,
              "Second date",
              Colors.orange,
            ),
            SizedBox(
              height: 10.0,
            ),
            buildChamberCard(
              context,
              "Second date",
              Colors.indigo,
            ),
            SizedBox(
              height: 10.0,
            ),
            buildChamberCard(
              context,
              "The next card is the last date",
              Colors.green,
            ),
            SizedBox(
              height: 10.0,
            ),
            buildChamberCard(
              context,
              "This is the last date",
              Colors.purple,
            ),
          ],
        ),
      ),
    );
  }

  Container buildChamberCard(
    BuildContext context,
    String text,
    Color color,
  ) {
    return Container(
      // Warning: hard-coding values like this is a bad practice
      padding: EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          width: 2.0,
          color: Colors.transparent.withOpacity(0.3),
        ),
      ),
      child: ExpansionTile(
        // leading: FlutterLogo(
        //   size: 72.0,
        // ),
        title: Text(
          text,
        ),
        //backgroundColor: kButtonSecondaryColor,
        childrenPadding: EdgeInsets.symmetric(horizontal: 24.0),
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 36.0,
              color: Colors.black.withOpacity(0.8),
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(
            height: 10.0,
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
