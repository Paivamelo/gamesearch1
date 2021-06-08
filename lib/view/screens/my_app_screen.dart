import 'package:gamesearch1/logic/manage_auth/auth_bloc.dart';
import 'package:gamesearch1/logic/manage_auth/auth_event.dart';
import 'package:gamesearch1/logic/manage_db/manage_remote_db_bloc.dart';
import 'package:gamesearch1/logic/monitor_db/monitor_db_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamesearch1/view/screens/feedback_screen/tela4_main.dart';
import 'package:gamesearch1/view/screens/user_screen/tela1_main.dart';

import 'game_screen/tela2_main.dart';
import 'news_screen/tela3_main.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _currentPage = 1;

  var _pages = [
    MainTela1(),
    MainTela2(),
    MainTela3(),
    MainTela4(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MonitorBloc()),
        BlocProvider(create: (_) => ManageRemoteBloc())
      ],
      child: Scaffold(
        body: _pages[_currentPage],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "Usuário"),
            BottomNavigationBarItem(icon: Icon(Icons.games), label: "Jogos"),
            BottomNavigationBarItem(
                icon: Icon(Icons.new_releases), label: "Últimas Notícias"),
            BottomNavigationBarItem(
                icon: Icon(Icons.feedback), label: "Feedback")
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
        appBar: AppBar(
          title: Text(
            "GameSearch",
            style: TextStyle(fontFamily: 'Play', fontSize: 30),
          ),
          actions: [
            TextButton.icon(
                style: TextButton.styleFrom(primary: Colors.white),
                icon: Icon(Icons.logout),
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(Logout());
                },
                label: Text("Sair"))
          ],
        ),
      ),
    );
  }
}
