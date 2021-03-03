import 'package:flutter/cupertino.dart';

enum TabItem { discover, chamber, profile } //third, fourth }

class TabItemData {
  const TabItemData({@required this.title, @required this.icon});

  final String title;
  final IconData icon;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.discover: TabItemData(title: 'Discover', icon: CupertinoIcons.rectangle_on_rectangle_angled),
    TabItem.chamber: TabItemData(title: 'Chamber', icon: CupertinoIcons.rays),//ImageIcon(AssetImage("images/logo.png"), color: Color(0xffFFFFFF)),
    TabItem.profile: TabItemData(title: 'Profile', icon: CupertinoIcons.person_alt),
  };
}
