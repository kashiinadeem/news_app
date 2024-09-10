import 'package:news_app/features/News/presentation/pages/PageView/newz_feed.dart';
import 'package:news_app/features/News/presentation/pages/PageView/search_page.dart';

mixin PageViewFunctions {
  final pages = [
    const NewzFeedPage(),
    const SearchPage(),
    // const FavouritesPage(),
  ];
}
