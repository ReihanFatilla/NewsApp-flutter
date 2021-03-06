import 'package:flutter/material.dart';
import 'package:news_app/Widget/carousel.dart';
import 'package:news_app/Widget/tabbar_menu.dart';
import 'dart:ui';
import 'package:news_app/model/model.dart';
import 'package:news_app/utils/utils.dart';

class NewsPage extends StatefulWidget {

  final List<Article> article;

  const NewsPage({ Key? key, required this.article }) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(left: 10),
          child: Text('Breaking News', style: titleHome,),),
          CarouselWidget(articleList: widget.article),
          TabBarMenu(article: widget.article)
        ],
      ),
    );
  }
}