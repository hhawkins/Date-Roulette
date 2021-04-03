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

  List<NewItem> items = <NewItem>[
    NewItem(
        false, // isExpanded ?
        'First Date', // header
        Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(children: <Widget>[
              RoundedButton(
                title: 'Details',
                color: kButtonSecondaryColor,
                textColor: kColorBlack,
                // onPressed: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => CardDetailView()),
                //   );
                // },
              ),
            ])), // body
        Icon(Icons.image) // iconPic
        ),
    NewItem(
        false, // isExpanded ?
        'Second Date', // header
        Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(children: <Widget>[
              RoundedButton(
                title: 'Details',
                color: kButtonSecondaryColor,
                textColor: kColorBlack,
                // onPressed: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => CardDetailView()),
                //   );
                // },
              ),
            ])), // body
        Icon(Icons.image) // iconPic
        ),
    NewItem(
        false, // isExpanded ?
        'Third Date', // header
        Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(children: <Widget>[
              RoundedButton(
                title: 'Details',
                color: kButtonSecondaryColor,
                textColor: kColorBlack,
                // onPressed: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => CardDetailView()),
                //   );
                // },
              ),
            ])), // body
        Icon(Icons.image) // iconPic
        ),
    NewItem(
        false, // isExpanded ?
        'Fourth Date', // header
        Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(children: <Widget>[
              RoundedButton(
                title: 'Details',
                color: kButtonSecondaryColor,
                textColor: kColorBlack,
                // onPressed: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => CardDetailView()),
                //   );
                // },
              ),
            ])), // body
        Icon(Icons.image) // iconPic
        ),
  ];
  //ListView List_Criteria;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            SizedBox(
              height: 100.0,
            ),
            /* The current implementation is a place holder
            eventually, we'd like to have a smooth setup for the cards like this
            https://github.com/2d-inc/HistoryOfEverything */
            //buildChamberCard(context)
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  items[index].isExpanded = !items[index].isExpanded;
                });
              },
              children: items.map((NewItem item) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                        leading: item.iconpic,
                        title: Text(
                          item.header,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ));
                  },
                  isExpanded: item.isExpanded,
                  body: item.body,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Card buildChamberCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.red,
      child: ExpansionTile(
        // leading: FlutterLogo(
        //   size: 72.0,
        // ),
        title: Text("First Date"),
        backgroundColor: kButtonSecondaryColor,
        childrenPadding: EdgeInsets.symmetric(horizontal: 24.0),
        children: [
          Text(
            "First Date",
            style: TextStyle(
              fontSize: 36.0,
              color: Colors.black.withOpacity(0.8),
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(
            height: 30.0,
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
