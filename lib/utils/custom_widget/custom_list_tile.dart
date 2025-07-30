import 'package:flutter/material.dart';
import 'package:starwars/data/model/news_model.dart';
import 'package:starwars/screens/detail_news/detail_news.dart';

Widget customListTile(News news, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailNews(news)),
      );
    },
    child: Container(
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.00,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(news.urlToImage!),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          SizedBox(height: 8.0),
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 91, 21, 16),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Text(
              news.source!.name!,
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 2.0),
          Text(news.title!, style: TextStyle(color: Colors.blue)),
        ],
      ),
    ),
  );
}
