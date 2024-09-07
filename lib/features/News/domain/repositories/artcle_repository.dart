import 'package:news_app/core/dataState.dart';
import 'package:news_app/features/News/data/models/article_model.dart';
import 'package:news_app/features/News/data/models/source_model.dart';

abstract class ArtcleRepository {
  Future<DataState<ArticleModel>> getArticles(
      {required String? country, required String? category});

  Future<DataState<ArticleModel>> searchArticles(
      {required String? query, required String? category});

  Future<DataState<List<SourceModel>>> getSources(
      {required String? country, required String? category});
}
