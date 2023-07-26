import 'package:flutter/material.dart';
import 'package:news/News/NewsDetails.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/my_theme.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(NewsDetails.routeName,arguments: news);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 220,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(news.urlToImage ?? '',
                width: double.infinity,
                height: 220,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 8,),
            Text(news.author ?? '',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: MyTheme.greyColor,
            ),
            ),
            Text(news.title ?? '',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: MyTheme.blackColor,
              ),
              maxLines: 2,
            ),
            Text(news.publishedAt ?? '',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: MyTheme.greyColor,
              ),
              textAlign: TextAlign.end,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
