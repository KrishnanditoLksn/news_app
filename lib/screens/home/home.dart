import 'package:flutter/material.dart';
import 'package:starwars/utils/custom_widget/search_bar/custom_search_appbar.dart';
import 'package:starwars/utils/custom_widget/list_tile/news_list_tile.dart';
import 'package:starwars/data/model/news_model.dart';
import 'package:starwars/services/news_api_service.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "News App Lesgo",
          style: TextStyle(color: const Color.fromARGB(255, 26, 84, 131)),
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                onPressed:
                    () => {
                      showSearch(
                        context: context,
                        delegate: CustomSearchAppbar(),
                      ),
                    },
                icon: Icon(Icons.search),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: client.getNews(),
        builder: (BuildContext context, AsyncSnapshot<List<News>> snapshot) {
          if (snapshot.hasData) {
            List<News>? articles = snapshot.data;
            return ListView.builder(
              itemCount: articles!.length,
              itemBuilder:
                  (context, index) => customListTile(articles[index], context),
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
