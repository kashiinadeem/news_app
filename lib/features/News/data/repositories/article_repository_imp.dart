import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/core/dataState.dart';
import 'package:news_app/features/News/data/datasources/article_api.dart';
import 'package:news_app/features/News/data/models/article_model.dart';
import 'package:news_app/features/News/data/models/source_model.dart';
import 'package:news_app/features/News/domain/repositories/artcle_repository.dart';

class ArticleRepositoryImp implements ArtcleRepository {
  final ArticleApi articleApi;

  ArticleRepositoryImp({required this.articleApi});

  @override
  Future<DataState<ArticleModel>> getArticles(
      {required String? country, required String? category}) async {
    try {
      final apiKey = DotEnv().get('API_KEY');

      final data = await articleApi.getArticles(
          apiKey: apiKey, country: country, category: category);

      if (data.response.statusCode == HttpStatus.ok) {
        final listArticles = ArticleModel.fromJson(data.data);
        return DataSuccess(listArticles);
      } else {
        return DataError(data.data['message']);
      }
    } on DioException catch (e) {
      return DataError(e.message.toString());
    }
  }

  @override
  Future<DataState<List<SourceModel>>> getSources(
      {required String? country, required String? category}) async {
    try {
      final apiKey = DotEnv().get('API_KEY');

      final data = await articleApi.getSources(
          country: country, category: category, apiKey: apiKey);

      if (data.response.statusCode == HttpStatus.ok) {
        final List<dynamic> list = data.data;
        final listSources = List<SourceModel>.from(list);
        return DataSuccess(listSources);
      } else {
        return DataError(data.data['message']);
      }
    } on DioException catch (e) {
      return DataError(e.message.toString());
    }
  }

  @override
  Future<DataState<ArticleModel>> searchArticles(
      {required String? query, required String? category}) async {
    try {
      final apiKey = DotEnv().get('API_KEY');

      final data = await articleApi.searchArticles(
          query: query, category: category, apiKey: apiKey);

      if (data.response.statusCode == HttpStatus.ok) {
        final listArticles = ArticleModel.fromJson(data.data);
        return DataSuccess(listArticles);
      } else {
        return DataError(data.data['message']);
      }
    } on DioException catch (e) {
      return DataError(e.message.toString());
    }
  }
}
