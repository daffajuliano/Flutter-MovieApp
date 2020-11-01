import 'package:flutter/material.dart';

class BackdropWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: Stack(
        children: [
          Container(
            height: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.srcOver),
                image: AssetImage(
                  'assets/images/cap_america.jpg',
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 16, right: 16, bottom: 60),
              child: Text(
                'Lord of The rings',
                style: TextStyle(
                  fontSize: 19,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
