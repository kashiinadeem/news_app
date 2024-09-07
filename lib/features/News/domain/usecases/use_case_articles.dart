import 'package:news_app/core/dataState.dart';
import 'package:news_app/core/useCases.dart';
import 'package:news_app/features/News/data/models/article_model.dart';
import 'package:news_app/features/News/data/models/source_model.dart';
import 'package:news_app/features/News/domain/repositories/artcle_repository.dart';

class CaseGetArticles extends UseCaseFuture<DataState<ArticleModel>, void> {
  final ArtcleRepository repository;

  CaseGetArticles({required this.repository});

  @override
  Future<DataState<ArticleModel>> call(
      {void params, String? country, String? category}) {
    return repository.getArticles(country: country, category: category);
  }
}

class CaseSearchArticles extends UseCaseFuture<DataState<ArticleModel>, void> {
  final ArtcleRepository repository;

  CaseSearchArticles({required this.repository});

  @override
  Future<DataState<ArticleModel>> call(
      {void params, String? query, String? category}) {
    return repository.searchArticles(query: query, category: category);
  }
}

class CaseGetSources extends UseCaseFuture<DataState<List<SourceModel>>, void> {
  final ArtcleRepository repository;

  CaseGetSources({required this.repository});

  @override
  Future<DataState<List<SourceModel>>> call(
      {void params, String? country, String? category}) {
    return repository.getSources(country: country, category: category);
  }
}
