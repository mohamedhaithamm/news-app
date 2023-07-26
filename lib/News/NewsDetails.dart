import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/NewsResponse.dart';
import '../my_theme.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = 'news-details';

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)!.settings.arguments as News;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
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
                child: Image.network(
                  news.urlToImage ?? '',
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                news.author ?? '',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: MyTheme.greyColor,
                ),
              ),
              Text(
                news.title ?? '',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: MyTheme.blackColor,
                ),
                maxLines: 2,
              ),
              Text(
                news.publishedAt ?? '',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: MyTheme.greyColor,
                ),
                textAlign: TextAlign.end,
                maxLines: 1,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(news.description ?? ''),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => _lunchUrl(news.url),
                    child: Text(
                      'Veiw Full Artical',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Icon(Icons.double_arrow),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
 Future<void> _lunchUrl(String? url)async{
    if(url == null) return;
    var uri = Uri.parse(url);
    if(await canLaunchUrl(uri)){
      launchUrl(uri);
    }
  }
}
