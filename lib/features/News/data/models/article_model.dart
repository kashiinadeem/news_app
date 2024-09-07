class ArticleModel {
  final String? status;
  final int? totalResults;
  final List<Articles>? articles;
  const ArticleModel({this.status, this.totalResults, this.articles});
  ArticleModel copyWith(
      {String? status, int? totalResults, List<Articles>? articles}) {
    return ArticleModel(
        status: status ?? this.status,
        totalResults: totalResults ?? this.totalResults,
        articles: articles ?? this.articles);
  }

  Map<String, Object?> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles':
          articles?.map<Map<String, dynamic>>((data) => data.toJson()).toList()
    };
  }

  static ArticleModel fromJson(Map<String, Object?> json) {
    return ArticleModel(
        status: json['status'] == null ? null : json['status'] as String,
        totalResults:
            json['totalResults'] == null ? null : json['totalResults'] as int,
        articles: json['articles'] == null
            ? null
            : (json['articles'] as List)
                .map<Articles>(
                    (data) => Articles.fromJson(data as Map<String, Object?>))
                .toList());
  }

  @override
  String toString() {
    return '''ArticleModel(
                status:$status,
totalResults:$totalResults,
articles:${articles.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is ArticleModel &&
        other.runtimeType == runtimeType &&
        other.status == status &&
        other.totalResults == totalResults &&
        other.articles == articles;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, status, totalResults, articles);
  }
}

class Articles {
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  const Articles(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});
  Articles copyWith(
      {Source? source,
      String? author,
      String? title,
      String? description,
      String? url,
      String? urlToImage,
      String? publishedAt,
      String? content}) {
    return Articles(
        source: source ?? this.source,
        author: author ?? this.author,
        title: title ?? this.title,
        description: description ?? this.description,
        url: url ?? this.url,
        urlToImage: urlToImage ?? this.urlToImage,
        publishedAt: publishedAt ?? this.publishedAt,
        content: content ?? this.content);
  }

  Map<String, Object?> toJson() {
    return {
      'source': source?.toJson(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content
    };
  }

  static Articles fromJson(Map<String, Object?> json) {
    return Articles(
        source: json['source'] == null
            ? null
            : Source.fromJson(json['source'] as Map<String, Object?>),
        author: json['author'] == null ? null : json['author'] as String,
        title: json['title'] == null ? null : json['title'] as String,
        description:
            json['description'] == null ? null : json['description'] as String,
        url: json['url'] == null ? null : json['url'] as String,
        urlToImage:
            json['urlToImage'] == null ? null : json['urlToImage'] as String,
        publishedAt:
            json['publishedAt'] == null ? null : json['publishedAt'] as String,
        content: json['content'] == null ? null : json['content'] as String);
  }

  @override
  String toString() {
    return '''Articles(
                source:${source.toString()},
author:$author,
title:$title,
description:$description,
url:$url,
urlToImage:$urlToImage,
publishedAt:$publishedAt,
content:$content
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Articles &&
        other.runtimeType == runtimeType &&
        other.source == source &&
        other.author == author &&
        other.title == title &&
        other.description == description &&
        other.url == url &&
        other.urlToImage == urlToImage &&
        other.publishedAt == publishedAt &&
        other.content == content;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, source, author, title, description, url,
        urlToImage, publishedAt, content);
  }
}

class Source {
  final dynamic id;
  final String? name;
  const Source({this.id, this.name});
  Source copyWith({dynamic id, String? name}) {
    return Source(id: id ?? this.id, name: name ?? this.name);
  }

  Map<String, Object?> toJson() {
    return {'id': id, 'name': name};
  }

  static Source fromJson(Map<String, Object?> json) {
    return Source(
        id: json['id'] as dynamic,
        name: json['name'] == null ? null : json['name'] as String);
  }

  @override
  String toString() {
    return '''Source(
                id:$id,
name:$name
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Source &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.name == name;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name);
  }
}
