import 'package:Date_Roulette/screens/main_tab_views/profile_view.dart';
import 'package:flutter/material.dart';

import 'main_tab_views/cupertino_main_scaffold.dart';
import 'main_tab_views/tab_item.dart';

class MainTabScreen extends StatefulWidget {
  static const String id = 'main_tab_screen';

  @override
  _MainTabScreenState createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  TabItem _currentTab = TabItem.teams;

  Map<TabItem, WidgetBuilder> get widgetBuilders {
    return {
      TabItem.teams: (_) => Scaffold(),
      // Scaffold is a place holder till the views are built
      TabItem.new_event: (_) => Scaffold(),
      TabItem.profile: (_) => ProfileView(),
    };
  }

  void _select(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoMainScaffold(
      currentTab: _currentTab,
      onSelectTab: _select,
      widgetBuilders: widgetBuilders,
    );
  }
}
