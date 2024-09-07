import 'package:dio/dio.dart';
import 'package:news_app/constants/constants.dart';
import 'package:retrofit/retrofit.dart';

part 'article_api.g.dart';

@RestApi()
abstract class ArticleApi {
  @GET('v2/top-headlines')
  Future<HttpResponse> getArticles(
      {@Query('apiKey') required String? apiKey,
      @Query('country') required String? country,
      @Query('category') required String? category});

  @GET('v2/top-headlines')
  Future<HttpResponse> searchArticles(
      {@Query('apiKey') required String? apiKey,
      @Query('q') required String? query,
      @Query('category') required String? category});

  @GET('v2/top-headlines/sources')
  Future<HttpResponse> getSources(
      {@Query('apiKey') required String? apiKey,
      @Query('country') required String? country,
      @Query('category') required String? category});
}
