import 'package:flutter/material.dart';
import '../api_manager.dart';
import '../model/NewsResponse.dart';
import '../my_theme.dart';
import 'news_item.dart';

class NewsSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () => showResults(context),
          icon: Icon(
            Icons.search,
            size: 28,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(
          Icons.close,
          size: 24,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManage.getNews(keyWordSearch: query),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: MyTheme.primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text('something went wrong'),
                ElevatedButton(onPressed: () {}, child: Text('Try again'))
              ],
            );
          }
          if (snapshot.data?.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data?.message ?? ''),
                ElevatedButton(onPressed: () {}, child: Text('Try Again'))
              ],
            );
          }
          var newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemCount: newsList.length,
            itemBuilder: ((context, index) {
              return NewsItem(news: newsList[index]);
            }),
          );
        }));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Center(
          child: Text(
        'Search',
        style: TextStyle(fontSize: 20),
      ));
    } else {
      return FutureBuilder<NewsResponse>(
          future: ApiManage.getNews(keyWordSearch: query),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: MyTheme.primaryColor,
                ),
              );
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  Text('something went wrong'),
                  ElevatedButton(onPressed: () {}, child: Text('Try again'))
                ],
              );
            }
            if (snapshot.data?.status != 'ok') {
              return Column(
                children: [
                  Text(snapshot.data?.message ?? ''),
                  ElevatedButton(onPressed: () {}, child: Text('Try Again'))
                ],
              );
            }
            var newsList = snapshot.data?.articles ?? [];
            return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: ((context, index) {
                return NewsItem(news: newsList[index]);
              }),
            );
          }));
    }
  }
}
