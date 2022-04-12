import 'package:flutter/material.dart';
import 'package:news_app/model/model.dart';
import 'package:news_app/screen/newspage.dart';
import 'package:news_app/service/service.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var news = News();
    
    return Scaffold(
        appBar: AppBar(
          leading: Container(
            width: 10,
            margin: EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network("https://www.numerama.com/wp-content/uploads/2021/12/nft-singes.jpg", fit: BoxFit.cover)),
          ),
          title: const Text("Good Morning", style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(onPressed: (){},
            icon: const Icon(Icons.bookmark, color: Colors.blue,))
          ],
        ),
        body: FutureBuilder(
          future: news.getNews(),
          builder: (context, snapshot) => snapshot.data != null
          ? NewsPage(article: snapshot.data as List<Article>)
          : Center(child: CircularProgressIndicator(),),
        ),
    );
  }
}