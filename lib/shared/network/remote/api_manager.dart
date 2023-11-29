import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/models/everything_model.dart';
import 'package:news_app/models/sources_model.dart';

import '../../componets/constants.dart';

class ApiManager {


  static Future<SourcesModel> getSources(
  String catId
  ) async {
    Uri url = Uri.https(base_url, "/v2/top-headlines/sources", {
      "apiKey": apiKey,
      "catId":catId

    });
    Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    SourcesModel data = SourcesModel.fromJson(jsonData);
    return data;
  }

  static Future<EverythingModel> getNews({
    String? sourceId,
    String? searchKeyWord,
    String? content
  }) async {
    Uri url = Uri.https(base_url, "/v2/everything", {
      "apiKey": apiKey,
      "sources": sourceId,
      "content": content,
      "q": searchKeyWord,
    });

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    var newsResponse = EverythingModel.fromJson(jsonData);
    return newsResponse;
  }
}
