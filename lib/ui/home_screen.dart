import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movee/components/other/drawer_widget.dart';
import 'package:movee/components/home/top_rated_widget.dart';
import 'package:movee/components/home/popular_widget.dart';
import 'package:movee/components/home/slider_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScrenState createState() => _HomeScrenState();
}

class _HomeScrenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey[800]),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: FaIcon(FontAwesomeIcons.bars),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              FontAwesomeIcons.film,
              color: Colors.orange[600],
            ),
            SizedBox(width: 6),
            Text(
              'Movee',
              style: TextStyle(
                fontFamily: 'Josefin Sans',
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.solidUserCircle,
              color: Colors.grey[850],
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: DrawerWidget.drawer(context),
      body: Container(
        margin: const EdgeInsets.only(bottom: 16),
        color: Colors.grey[100],
        child: ListView(
          children: [
            SliderWidget(),
            TopRatedWidget(),
            SizedBox(height: 10),
            PopularWidget(),
          ],
        ),
      ),
    );
  }
}
