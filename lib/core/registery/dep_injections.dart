import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/features/News/data/datasources/article_api.dart';
import 'package:news_app/features/News/data/repositories/article_repository_imp.dart';
import 'package:news_app/features/News/domain/repositories/artcle_repository.dart';
import 'package:news_app/features/News/domain/usecases/use_case_articles.dart';
import 'package:news_app/features/News/presentation/bloc/bloc.dart';
import 'package:news_app/features/Themes/theme_bloc.dart';

final getIt = GetIt.instance;

Future<void> initailizeDep() async {
  getIt.registerSingleton<Dio>(Dio());

  // theme bloc
  getIt.registerFactory<ThemeBloc>(() => ThemeBloc());

  // newz bloc
  getIt.registerSingleton<ArticleApi>(ArticleApi(getIt()));
  getIt.registerSingleton<ArtcleRepository>(
      ArticleRepositoryImp(articleApi: getIt()));
  getIt
      .registerSingleton<CaseGetArticles>(CaseGetArticles(repository: getIt()));
  getIt.registerSingleton<CaseSearchArticles>(
      CaseSearchArticles(repository: getIt()));
  getIt.registerSingleton<CaseGetSources>(CaseGetSources(repository: getIt()));
  getIt.registerFactory(() => NewsBloc(getIt(), getIt(), getIt()));
}
