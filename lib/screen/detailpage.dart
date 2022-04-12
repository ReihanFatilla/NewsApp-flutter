import 'package:flutter/material.dart';
import 'package:news_app/Utils/utils.dart';
import 'package:news_app/model/model.dart';
import 'package:timeago/timeago.dart' as timeago;

class DetailPage extends StatefulWidget {

  final Article article;
  const DetailPage({ Key? key, required this.article }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(widget.article.urlToImage, height: 350, fit: BoxFit.cover,),
            ListView(
              children: [
                SizedBox(height: 330,),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(20)), color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 26,),
                        Text(widget.article.title, style: titleArticle.copyWith(fontSize: 15),
                        ),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            Row(
                              children: [
                                Icon(Icons.account_circle),
                                SizedBox(width: 10,),
                                Text(
                                  widget.article.author,
                                style: authorDateArticle.copyWith(fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.calendar_today_outlined),
                                SizedBox(width: 10,),
                                Text(
                                  nowTime(DateTime.parse(widget.article.publishedAt)),
                                style: authorDateArticle.copyWith(fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text(
                          widget.article.content,
                          style: detailArticle.copyWith(fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(0,10),
                        blurRadius: 10
                      )]
                    ),
                    child: IconButton
                    (

                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(50),
                      boxShadow: [BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(0,10),
                        blurRadius: 10
                      )]
                    ),
                    child: Icon(Icons.bookmark_border),
                  )
                ],
              ),
            )
          ]
        ),
      )
    );
  }

  String nowTime(DateTime parse){
    return timeago.format(parse, allowFromNow: true, locale: "id");
  }
}