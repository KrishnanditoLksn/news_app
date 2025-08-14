import 'package:flutter/material.dart';
import 'package:starwars/data/model/news_model.dart';
import 'package:starwars/services/news_api_service.dart';
import 'package:starwars/utils/custom_widget/item_search_status.dart';
import 'package:starwars/utils/custom_widget/list_tile/news_list_tile.dart';

class CustomSearchAppbar extends SearchDelegate {
  ApiService apiService = ApiService();
  final String src = "assets/images/no-results.png";
  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
      onPressed: () => query.isEmpty ? close(context, null) : query = "",
      icon: Icon(Icons.clear),
    ),
  ];

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => {close(context, null)},
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: apiService.searchNews(query),
      builder: (BuildContext context, AsyncSnapshot<List<News>> snapshot) {
        if (snapshot.hasData) {
          List<News>? newsItem = snapshot.data;
          if (newsItem!.isEmpty) {
            return ItemSearchStatus(src, "News Not Found ");
          }
          return ListView.builder(
            itemCount: newsItem.length,
            itemBuilder:
                (context, index) => customListTile(newsItem[index], context),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ItemSearchStatus(src, "Search Your News");
  }
}
