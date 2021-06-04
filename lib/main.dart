import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamesearch1/logic/manage_db/manage_remote_db_bloc.dart';
import 'package:gamesearch1/view/login.dart';
import 'package:gamesearch1/view/loginweb.dart';
import 'package:gamesearch1/view/user_list.dart';

import 'logic/manage_db/manage_local_db_bloc.dart';
import 'logic/monitor_db/monitor_db_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _currentPage = 0;

  var _pages = [TelaLogin(), TelaLogin1(), UserList()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => MonitorBloc()),
          BlocProvider(create: (_) => ManageLocalBloc()),
          BlocProvider(create: (_) => ManageremoteBloc())
        ],
        child: Scaffold(
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
                  icon: Icon(Icons.vpn_key), label: "Login"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: "Loginweb"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: "Usuário"),
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
      ),
    );
  }
}
