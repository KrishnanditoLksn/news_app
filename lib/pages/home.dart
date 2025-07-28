import 'package:flutter/material.dart';
import 'package:starwars/model/news_model.dart';
import 'package:starwars/services/api_service.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  MyHomeState createState() => MyHomeState();
}

class MyHomeState extends State<MyHome> {
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News App Lesgo",
          style: TextStyle(color: const Color.fromARGB(255, 26, 84, 131)),
        ),
      ),

      body: FutureBuilder(
        future: client.getNews(),
        builder: (BuildContext context, AsyncSnapshot<List<News>> snapshot) {
          if (snapshot.hasData) {
            List<News>? articles = snapshot.data;
            return ListView.builder(
              itemCount: articles!.length,
              itemBuilder:
                  (context, index) =>
                      ListTile(title: Text(articles[index].title!)),
            );
          }
          if (snapshot.hasError) {
            return Text("Error ${snapshot.error}");
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
