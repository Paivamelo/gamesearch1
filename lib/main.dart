import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gamesearch1/view/bottom_navigation_bar.dart';
import 'package:gamesearch1/view/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: Splash()));
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyBottomNavigationBar();
  }
}
