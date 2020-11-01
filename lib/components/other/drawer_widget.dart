import 'package:flutter/material.dart';

class DrawerWidget {
  static Widget drawer(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
