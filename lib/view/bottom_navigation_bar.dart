import 'package:flutter/material.dart';
import 'package:gamesearch1/view/tela1/tela1_main.dart';
import 'package:gamesearch1/view/tela2/aboutgame.dart';
import 'package:gamesearch1/view/tela2/tela2_main.dart';
import 'package:gamesearch1/view/tela3/infonews.dart';
import 'package:gamesearch1/view/tela3/tela3_main.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyBottomNavigationBarState();
  }
}

class MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentPage = 1;
  List<Widget> _pages = [
    MainTela1(),
    MainTela2(),
    MainTela3(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.pink),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "GameSearch",
            style: TextStyle(fontFamily: 'Play', fontSize: 30),
          ),
        ),
        body: _pages[_currentPage],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "Usuário"),
            BottomNavigationBarItem(icon: Icon(Icons.games), label: "Jogos"),
            BottomNavigationBarItem(
                icon: Icon(Icons.new_releases), label: "Últimas Notícias")
          ],
          backgroundColor: Colors.pink,
          unselectedItemColor: Colors.white,
          fixedColor: Colors.black,
          currentIndex: _currentPage,
          onTap: (int index) {
            setState(() {
              _currentPage = index;
            });
          },
        ),
      ),
      routes: {
        AboutGame.routeName: (ctx) => AboutGame(),
        InfoNews.routeName: (ctx) => InfoNews(),
      },
    );
  }
}
