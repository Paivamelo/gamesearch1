import 'package:flutter/material.dart';

import '../model/news.dart';
import '../view/tela3/infonews.dart';

class NewsList extends StatelessWidget {
  final int index;
  NewsList(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              InfoNews.routeName,
              arguments: {
                'id': newsList[index].id,
                'title': newsList[index].title,
                'image': newsList[index].image,
                'description': newsList[index].description,
                'date': newsList[index].date,
              },
            );
          },
          child: Card(
            elevation: 5,
            child: Row(
              children: <Widget>[
                Hero(
                  tag: newsList[index].id,
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
                          newsList[index].image,
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
                          newsList[index].title,
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 5, left: 15),
                        child: Text(newsList[index].date,
                            style: TextStyle(fontSize: 13),
                            textAlign: TextAlign.center),
                      )
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
