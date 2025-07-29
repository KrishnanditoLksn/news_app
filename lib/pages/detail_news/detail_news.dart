import 'package:flutter/material.dart';
import 'package:starwars/model/news_model.dart';

class DetailNews extends StatelessWidget {
  final News detailNews;

  const DetailNews(this.detailNews, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(
          "News Detail",
          textDirection: TextDirection.ltr,
          style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                detailNews.title!,
                style: TextStyle(
                  color: const Color.fromARGB(255, 1, 35, 86),
                  fontSize: 25,
                  fontFamily: 'PTSans',
                ),
              ),
            ),
            SizedBox(height: 35),

            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                detailNews.urlToImage!,
                fit: BoxFit.fill,
                width: 400,
              ),
            ),

            SizedBox(height: 35),
            Container(
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: EdgeInsets.all(1),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    detailNews.author!,
                    style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                detailNews.description!,
                style: TextStyle(fontSize: 19),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
