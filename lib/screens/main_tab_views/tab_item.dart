import 'package:flutter/material.dart';

enum TabItem { teams, new_event, profile } //third, fourth }

class TabItemData {
  const TabItemData({@required this.title, @required this.icon});

  final String title;
  final IconData icon;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.teams: TabItemData(title: '', icon: Icons.group),
    TabItem.new_event: TabItemData(title: '', icon: Icons.plus_one),
    TabItem.profile: TabItemData(title: '', icon: Icons.person),
  };
}
