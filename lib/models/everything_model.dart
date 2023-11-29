import 'package:news_app/models/sources_model.dart';

class EverythingModel {
  EverythingModel({
      this.status, 
      this.totalResults,
    this.message,
    this.code,
      this.articles,});

  EverythingModel.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    message = json['message'];
    code = json['code'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Articles.fromJson(v));
      });
    }
  }
  String? status;
  int? totalResults;
  String? code;
  String? message;
  List<Articles>? articles;


}

class Articles {
  Articles({
      this.source, 
      this.author, 
      this.title,

      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  Articles.fromJson(dynamic json) {
    source = json['source'] != null ? Sources.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];

    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Sources? source;
  String? author;
  String? title;

  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;


}

