import 'package:starwars/data/datasource/data_source.dart';

class News {
  DataSource? source;

  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  News({
    this.author,
    this.description,
    this.title,
    this.source,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      source:json['source'] != null ? DataSource.fromJson(json['source']) : null,
      author: json['author'] ?? "No Author Found",
      title: json['title'] ?? "No Title Found",
      description: json['description'] ?? "IYAKAH",
      url: json['url'] ?? "PAAN SI",
      urlToImage:
          json['urlToImage'] ??
          "https://unsplash.com/photos/a-stack-of-newspapers-sitting-on-top-of-each-other-6khMCoTlLG4",
      publishedAt: json['publishedAt'],
      content: json['content'] ?? "No Data Found",
    );
  }
}
