part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  final ArticleModel? articleModel;
  final List<SourceModel>? listSources;
  final String? error;

  const NewsState({this.articleModel, this.listSources, this.error});

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  const NewsLoadedState({super.articleModel});
}

class SourcesLoadedState extends NewsState {
  const SourcesLoadedState({super.listSources});
}

class NewsErrorState extends NewsState {
  const NewsErrorState({super.error});
}
