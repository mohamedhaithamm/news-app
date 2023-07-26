import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';


class ApiManage{
static const String baseUrl = 'newsapi.org';

  static Future<SourceResponse> getSources(String? categoryId)async{
    ///https://newsapi.org/v2/top-headlines/sources?apiKey=ecb54743e2e34f178a5dc56277056822

    var url = Uri.https(baseUrl,'/v2/top-headlines/sources',{
      "apiKey" : "ecb54743e2e34f178a5dc56277056822",
      "category" : categoryId
    });

    var response = await http.get(url);                             /// response
    try{
      var bodyString = response.body;                                 /// body(String)
      var json = jsonDecode(bodyString);                              /// json
      var sourceResponse = SourceResponse.fromJson(json);             /// source response
      return sourceResponse ;
    }catch(e){
      throw e ;
    }
  }


  static Future<NewsResponse> getNews(
      {String? sourceId, String? keyWordSearch})async{
    var url = Uri.https(baseUrl,'/v2/everything',
        {
          "apiKey" : "ecb54743e2e34f178a5dc56277056822",
          "sources" : sourceId,
          "q" : keyWordSearch
        }
    );
    try{
        var response = await http.get(url);
        var bodyString = response.body;
        var json = jsonDecode(bodyString);
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }catch(e){
      throw e ;
    }

  }
}