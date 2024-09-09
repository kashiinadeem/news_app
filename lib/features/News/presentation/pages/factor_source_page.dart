import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/extensions/context.dart';
import 'package:news_app/features/News/data/models/article_model.dart';
import 'package:news_app/features/News/presentation/bloc/bloc.dart';
import 'package:news_app/features/News/presentation/widgets/Body/newz_feed_widget.dart';

class FactorSourcePage extends StatefulWidget {
  final NewsBloc homeNewzBloc;
  const FactorSourcePage({
    super.key,
    required this.homeNewzBloc,
  });

  @override
  State<FactorSourcePage> createState() => _FactorSourcePageState();
}

class _FactorSourcePageState extends State<FactorSourcePage> {
  List<Articles> allArticles = [];
  List<Articles> paginatedArticles = [];
  int currentPage = 0;
  int pageSize = 8;
  final scrollController = ScrollController();

  @override
  void initState() {
    widget.homeNewzBloc.add(const SearchArticlesEvent(query: 'us'));

    scrollController.addListener(_onScroll);
    _loadMoreData();
    super.initState();
  }

  @override
  void dispose() {
    // scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
  }

  void _loadMoreData() {
    if (currentPage * pageSize >= allArticles.length) return;

    // Calculate the next page data
    int startIndex = currentPage * pageSize;
    int endIndex = startIndex + pageSize;
    if (endIndex > allArticles.length) endIndex = allArticles.length;

    setState(() {
      paginatedArticles.addAll(allArticles.sublist(startIndex, endIndex));
      currentPage++;
    });
  }

  void _onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      _loadMoreData(); // Load more data when scrolled to the bottom
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsBloc, NewsState>(
      bloc: widget.homeNewzBloc,
      builder: (context, state) {
        if (state is NewsLoadedState) {
          if (paginatedArticles.isEmpty) {
            return const Center(
              child: Text('List is Empty'),
            );
          }

          paginatedArticles.removeWhere((item) => item.urlToImage == null);

          return Column(
            children: [
              ListView.separated(
                padding: context.p20,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final article = paginatedArticles[index];
                  return NewzFeedWidget(article: article);
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: context.focus,
                  );
                },
                itemCount: paginatedArticles.length,
              ),
              if (currentPage * pageSize < allArticles.length)
                SizedBox(
                  height: 70,
                  child: RawChip(
                    onPressed: _loadMoreData,
                    label: const Text("Load More"),
                  ),
                ),
            ],
          );
        }

        return Container();
      },
      listener: (BuildContext context, NewsState state) {
        if (state is NewsLoadedState) {
          final articles = state.articleModel?.articles ?? [];
          for (var article in articles) {
            allArticles.add(article);
          }
          _loadMoreData();
        }
      },
    );
  }
}
