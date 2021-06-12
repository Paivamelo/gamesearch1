import 'package:flutter/material.dart';
import 'package:gamesearch1/models/news.dart';
import 'package:gamesearch1/widget/newslist.dart';

class MainTela3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (ctx, index) => NewsList(index),
    );
  }
}
