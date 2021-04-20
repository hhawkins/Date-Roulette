import 'package:Date_Roulette/screens/main_tab_views/chamber_view.dart';
import 'package:Date_Roulette/screens/main_tab_views/discover_view.dart';
import 'package:Date_Roulette/screens/main_tab_views/settings_view.dart';
import 'package:flutter/material.dart';

import 'cupertino_main_scaffold.dart';
import 'tab_item.dart';

class MainTabScreen extends StatefulWidget {
  static const String id = 'main_tab_screen';

  @override
  _MainTabScreenState createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  TabItem _currentTab = TabItem.discover;

  Map<TabItem, WidgetBuilder> get widgetBuilders {
    return {
      // Scaffold is a place holder till the views are built
      TabItem.discover: (_) => DiscoverView(),
      TabItem.chamber: (_) => ChamberView(),
      TabItem.profile: (_) => SettingsView(),
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
