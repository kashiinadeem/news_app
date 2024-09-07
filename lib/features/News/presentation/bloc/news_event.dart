part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class ArticleInitialEvent extends NewsEvent {}

class GetArticlesEvent extends NewsEvent {
  final String? country, category;

  const GetArticlesEvent({this.country, this.category});
}

class SearchArticlesEvent extends NewsEvent {
  final String? query, category;

  const SearchArticlesEvent({this.query, this.category});
}

class GetArticlesSourcesEvent extends NewsEvent {
  final String? country, category;

  const GetArticlesSourcesEvent({this.country, this.category});
}
