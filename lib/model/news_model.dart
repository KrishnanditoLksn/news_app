import 'package:starwars/model/data_source.dart';

class NewsModel {
  late DataSource source;

  String author;
  String title;
  String description;
  String url;

  NewsModel({
    required this.author,
    required this.description,
    required this.title,
    required this.source,
    required this.url,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      author: json['author'],
      description: json['description'],
      title: json['title'],
      source: json['source'],
      url: json['url'],
    );
  }
}
