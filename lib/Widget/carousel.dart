import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Utils/utils.dart';
import 'package:news_app/model/model.dart';
import 'package:news_app/screen/detailpage.dart';


class CarouselWidget extends StatefulWidget {
  final List<Article> articleList;

  const CarouselWidget({ Key? key, required this.articleList }) : super(key: key);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {

late List<Widget> imageSlider;

  @override
  void initState(){
    imageSlider = widget.articleList.map((article) => 
    GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(article: article))),
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image : NetworkImage(article.urlToImage),
                  fit: BoxFit.cover
                )
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.1, 0.9],
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.white.withOpacity(0.1)
                  ]
                )
              )
            ),
            Positioned(
              bottom: 10,
              child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 300,child: Text(article.title, style: titleArticleHeadline.copyWith(fontSize: 12), maxLines: 2, overflow: TextOverflow.ellipsis,),),
                  SizedBox(height: 10),
                  SizedBox(width: 150,child: Text(article.author, style: authorDateArticleHeadline.copyWith(fontSize: 10),))
                ],
              ),
            ))
          ],
        ),
      ),
    ),
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imageSlider,
      options: CarouselOptions(autoPlay: true, viewportFraction: 1)
    );
  }
}