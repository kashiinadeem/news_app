import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/containers/blocs.dart';
import 'package:news_app/core/extensions/context.dart';
import 'package:news_app/core/registery/dep_injections.dart';
import 'package:news_app/features/News/data/models/article_model.dart';
import 'package:news_app/features/News/data/models/source_model.dart';
import 'package:news_app/features/News/presentation/bloc/bloc.dart';
import 'package:news_app/features/News/presentation/pages/factor_source_page.dart';
import 'package:news_app/features/News/presentation/widgets/Body/headline_widget.dart';
import 'package:news_app/features/News/presentation/widgets/Body/source_widget.dart';

class NewzFeedPage extends StatefulWidget {
  const NewzFeedPage({super.key});

  @override
  State<NewzFeedPage> createState() => _NewzFeedPageState();
}

class _NewzFeedPageState extends State<NewzFeedPage> {
  final headlineBloc = getIt<NewsBloc>();
  final homeNewzBloc = getIt<NewsBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    headlineBloc.close();
    homeNewzBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildBody();
  }

  Widget buildBody() {
    return BlocBuilder<SelectedCountry, SourceModel?>(
      builder: (context, source) {
        return SizedBox(
          height: context.height,
          child: ListView(
            shrinkWrap: true,
            children: [
              NewzHeadlines(
                headlineBloc: headlineBloc,
                source: source,
              ),
              context.h10,
              const SourceWidget(),
              context.h10,
              FactorSourcePage(
                homeNewzBloc: homeNewzBloc,
                source: source,
              )
            ],
          ),
        );
      },
    );
  }
}

class NewzHeadlines extends StatefulWidget {
  final NewsBloc headlineBloc;
  final SourceModel? source;
  const NewzHeadlines({super.key, required this.headlineBloc, this.source});

  @override
  State<NewzHeadlines> createState() => _NewzHeadlinesState();
}

class _NewzHeadlinesState extends State<NewzHeadlines> {
  List<Articles> allArticles = [];
  List<Articles> paginatedArticles = [];
  int currentPage = 0;
  int pageSize = 8;
  final scrollController = ScrollController();

  @override
  void initState() {
    widget.headlineBloc
        .add(GetArticlesEvent(country: widget.source?.country ?? 'us'));
    scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NewzHeadlines oldWidget) {
    allArticles.clear();
    widget.headlineBloc
        .add(GetArticlesEvent(country: widget.source?.country ?? 'us'));
    _loadMoreData();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: BlocConsumer<NewsBloc, NewsState>(
        bloc: widget.headlineBloc,
        builder: (context, state) {
          if (state is NewsLoadingState) {
            return const LinearProgressIndicator();
          }

          if (state is NewsLoadedState) {
            var articles = state.articleModel?.articles ?? [];

            if (articles.isEmpty) {
              return Center(
                child: Material(
                    color: Colors.deepOrange.shade50,
                    // borderRadius: context.r10,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('No Healines To Show'),
                        ],
                      ),
                    )),
              );
            }

            paginatedArticles.removeWhere((item) => item.urlToImage == null);

            return SizedBox(
              height: 280,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Top-Headlines',
                    style: context.h1,
                  ),
                  context.h10,
                  Expanded(
                    child: ListView.separated(
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final article = paginatedArticles[index];
                          return HeadlineWidget(
                            article: article,
                          );
                        },
                        separatorBuilder: (context, index) => context.w10,
                        itemCount: paginatedArticles.length),
                  ),
                ],
              ),
            );
          }

          if (state is NewsErrorState) {
            return Center(
              child: Text(state.error.toString()),
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
      ),
    );
  }
}
