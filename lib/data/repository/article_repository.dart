import 'dart:convert';
import 'dart:io';

import 'package:bloc_news_app/data/data_repository/http_service.dart';
import 'package:bloc_news_app/data/models/article_model.dart';

class ArticleRepository {
 Future<Article> fetchNewsFromDataRepo() async {
    try {
      final response = await NewsAPIRepository.fetchNews();
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final result = Article.fromJson(data);
        return result;
      } else {
        return null;
      }
    } on SocketException catch (e) {
      throw e;
    } on HttpException catch (e) {
      throw e;
    } on FormatException catch (e) {
      throw e;
    }
  }
}
