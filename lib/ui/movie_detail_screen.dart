import 'package:flutter/material.dart';
import 'package:movee/components/movie_detail/backdrop_widget.dart';

class MovieDetailScreen extends StatefulWidget {
  @override
  _MoviewDetailScreenState createState() => _MoviewDetailScreenState();
}

class _MoviewDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BackdropWidget(),
        ],
      ),
    );
  }
}
