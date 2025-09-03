import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:starwars/services/api/api_key.dart';

import 'package:starwars/data/model/news_model.dart';

class ApiService {
  final baseUrl = "newsapi.org";
  final client = http.Client();

  Future<List<News>> getNews(context) async {
    final queryParams = {
      'country': 'us',
      'category': 'health',
      'apikey': apikey,
    };

    try {
      final uri = Uri.https(baseUrl, '/v2/top-headlines', queryParams);
      final response = await client.get(uri);

      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];

      List<News> news =
          body.map((dynamic item) => News.fromJson(item)).toList();
      return news;
    } catch (e) {
      throw Exception(e);
    }

    /*
    Decode json body
    */
  }

  Future<List<News>> searchNews(String params) async {
    final searchQueryParams = {'q': params, 'apikey': apikey};

    try {
      final uri = Uri.https(baseUrl, '/v2/everything', searchQueryParams);
      final response = await client.get(uri);

      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];

      List<News> news =
          body.map((dynamic item) => News.fromJson(item)).toList();
      return news;
    } catch (e) {
      throw Exception(e);
    }
  }
}
