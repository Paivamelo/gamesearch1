import 'package:flutter/material.dart';

import '../models/games.dart';
import '../view/screens/game_screen/aboutgame.dart';

class GameList extends StatefulWidget {
  final int index;
  GameList(this.index);

  @override
  _GameListState createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  bool _hasBeenPressed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              AboutGame.routeName,
              arguments: {
                'id': gameList[widget.index].id,
                'title': gameList[widget.index].title,
                'genre': gameList[widget.index].genre,
                'image': gameList[widget.index].image,
                'dev': gameList[widget.index].dev,
                'description': gameList[widget.index].description,
                'year': gameList[widget.index].year,
                'trailer': gameList[widget.index].trailer,
              },
            );
          },
          child: Card(
            elevation: 5,
            child: Row(
              children: <Widget>[
                Hero(
                  tag: gameList[widget.index].id,
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
                          gameList[widget.index].image,
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
                          gameList[widget.index].title,
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
                          gameList[widget.index].dev,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    width: 50,
                    alignment: Alignment.topRight,
                    child: RaisedButton(
                      color: Colors.white,
                      elevation: 0,
                      child: new Icon(
                        Icons.favorite,
                        color: _hasBeenPressed ? Colors.red : Colors.grey,
                      ),
                      // 2
                      // 3
                      onPressed: () => {
                        setState(() {
                          _hasBeenPressed = !_hasBeenPressed;
                        })
                      },
                    )),
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
