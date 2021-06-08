import 'package:gamesearch1/view/auth/cadastro.dart';
import 'package:gamesearch1/view/auth/login.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthenticationScreenStatex();
  }
}

class _AuthenticationScreenStatex extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: TabBarView(
            children: [
              SignupPage(),
              TelaLogin(),
            ],
          ),
          appBar: AppBar(
            title: Text("Configuração de Usuários"),
            bottom: TabBar(
              tabs: [Tab(text: "Cadastrar"), Tab(text: "Efetuar Login")],
            ),
          ),
        ));
  }
}
