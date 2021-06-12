import 'package:flutter/material.dart';

import '../models/games.dart';
import '../view/screens/game_screen/aboutgame.dart';

class GameList extends StatelessWidget {
  final int index;
  GameList(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              AboutGame.routeName,
              arguments: {
                'id': gameList[index].id,
                'title': gameList[index].title,
                'genre': gameList[index].genre,
                'image': gameList[index].image,
                'dev': gameList[index].dev,
                'description': gameList[index].description,
                'year': gameList[index].year,
                'trailer': gameList[index].trailer,
              },
            );
          },
          child: Card(
            elevation: 5,
            child: Row(
              children: <Widget>[
                Hero(
                  tag: gameList[index].id,
                  child: Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          gameList[index].image,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(top: 15, left: 15),
                        child: Text(
                          gameList[index].title,
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: "Play",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 15),
                        width: 250,
                        child: Text(
                          gameList[index].dev,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
