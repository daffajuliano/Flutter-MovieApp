import 'package:flutter/material.dart';

class HomeTabBar {
  static Widget getTab(TabController controller) {
    return TabBar(
      controller: controller,
      isScrollable: true,
      indicatorColor: Colors.orange[600],
      labelColor: Colors.black,
      tabs: [
        Tab(
          child: Text('All'),
        ),
        Tab(
          child: Text('Recomended'),
        ),
        Tab(
          child: Text('Popular'),
        ),
        Tab(
          child: Text('Latest'),
        ),
        Tab(
          child: Text('Upcoming'),
        ),
      ],
    );
  }
}
