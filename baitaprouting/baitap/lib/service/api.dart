import 'package:baitap/model/article.dart';
import 'package:dio/dio.dart';

class API {
  final String APIkey = 'fcabf3173c784041bb36f18833d51db0';
  final String baseURL = 'https://newsapi.org/v2';

  Future<List<Article>> getAllNews() async {
       var url = '$baseURL/top-headlines?country=us&apiKey=$APIkey';
       var dio = Dio();
       var response = await dio.request(url);
       List<Article> listArticle = [];

       if(response.statusCode == 200){
        List list = response.data['articles'];
        listArticle = list.map((json) => Article.fromJson(json)).toList();
        print('Lay data thanh cong');
        if (listArticle.isNotEmpty){
          print(listArticle[0].title);
        } 
       } else {
        print('Loi API');
       }      
       return listArticle;
  }

}

