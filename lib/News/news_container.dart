import 'package:flutter/material.dart';
import 'package:news/News/news_item.dart';
import 'package:news/api_manager.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/my_theme.dart';

class NewsContainer extends StatelessWidget {
  Source source;
  NewsContainer({required this.source});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManage.getNews(sourceId: source.id ?? ''),
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
            }
            ),
          );
        }
        )
    );
  }
}
