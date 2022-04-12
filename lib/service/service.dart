import 'dart:convert';

import 'package:news_app/model/model.dart';
import 'package:http/http.dart' as http;

String apiKey = "b3ba1808179f41cfa957e874ead6123a";
String baseUrl = "https://newsapi.org/v2";

class News{
  Future<List<Article>?> getNews() async{
    List<Article>? list;

    String url ="$baseUrl/top-headlines?country=id&apiKey=$apiKey";

    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      var result = data["articles"] as List;
      list = result.map<Article>((json) => Article.fromJson(json)).toList();
      return list;
    } else {
      throw Exception("Tidak Dapat Mengambil Data");
    }
  }

  Future<List<Article>?> getBewsBycategory(String category) async {
    List<Article>?  list;
    String url = "$baseUrl/top-headlines?country=id&category=$category&apiKey=$apiKey";

    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      var result = data["articles"] as List;
      list = result.map((json) => Article.fromJson(json)).toList();
      return list;
    } else {
      throw Exception("Tidak Dapat Mengambil data");
    }

    return list;
  }
}