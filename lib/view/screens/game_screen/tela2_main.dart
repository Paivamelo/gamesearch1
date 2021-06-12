import 'package:flutter/material.dart';
import 'package:gamesearch1/models/games.dart';
import 'package:gamesearch1/widget/gamelist.dart';

class MainTela2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: gameList.length,
      itemBuilder: (ctx, index) => GameList(index),
    );
  }
}
