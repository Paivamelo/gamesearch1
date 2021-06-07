import 'package:flutter/material.dart';
import 'package:gamesearch1/view/bottom_navigation_bar.dart';
import 'package:gamesearch1/view/splash.dart';

void main() {
  runApp(MaterialApp(home: Splash()));
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyBottomNavigationBar();
  }
}
