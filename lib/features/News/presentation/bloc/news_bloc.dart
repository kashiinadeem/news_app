import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/core/dataState.dart';
import 'package:news_app/features/News/data/models/article_model.dart';
import 'package:news_app/features/News/data/models/source_model.dart';
import 'package:news_app/features/News/domain/usecases/use_case_articles.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final CaseGetArticles caseGetArticles;
  final CaseGetSources caseGetSources;
  final CaseSearchArticles caseSearchArticles;

  NewsBloc(this.caseGetArticles, this.caseGetSources, this.caseSearchArticles)
      : super(NewsInitial()) {
    on<GetArticlesEvent>(getArticles);
    on<SearchArticlesEvent>(searchArticles);
    on<GetArticlesSourcesEvent>(getArticlesSources);
  }

  Future<void> getArticles(
      GetArticlesEvent event, Emitter<NewsState> emit) async {
    emit(NewsLoadingState());

    final data =
        await caseGetArticles(category: event.category, country: event.country);

    if (data is DataSuccess) {
      emit(NewsLoadedState(articleModel: data.data));
    }

    if (data is DataError) {
      emit(NewsErrorState(error: data.error));
    }
  }

  Future<void> searchArticles(
      SearchArticlesEvent event, Emitter<NewsState> emit) async {
    emit(NewsLoadingState());

    final data =
        await caseSearchArticles(category: event.category, query: event.query);

    if (data is DataSuccess) {
      emit(NewsLoadedState(articleModel: data.data));
    }

    if (data is DataError) {
      emit(NewsErrorState(error: data.error));
    }
  }

  Future<void> getArticlesSources(
      GetArticlesSourcesEvent event, Emitter<NewsState> emit) async {
    emit(NewsLoadingState());

    final data =
        await caseGetSources(category: event.category, country: event.country);

    if (data is DataSuccess) {
      emit(SourcesLoadedState(listSources: data.data));
    }

    if (data is DataError) {
      emit(NewsErrorState(error: data.error));
    }
  }
}
