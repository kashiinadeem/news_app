import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/extensions/context.dart';
import 'package:news_app/core/registery/dep_injections.dart';
import 'package:news_app/features/News/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/News/presentation/widgets/Body/headline_widget.dart';
import 'package:news_app/features/News/presentation/widgets/Body/newz_feed_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final bloc = getIt<NewsBloc>();
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          onFieldSubmitted: (value) {
            if (value.isNotEmpty) {
              bloc.add(SearchArticlesEvent(query: value));
            }
          },
          decoration: InputDecoration(
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: context.r100, borderSide: context.sidenone),
              hintText: 'Search Newz'),
        ),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is NewsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is NewsLoadedState) {
            var articles = state.articleModel?.articles ?? [];

            if (articles.isEmpty) {
              return const Center(
                child: Text('List is Empty'),
              );
            }

            articles.removeWhere((item) => item.urlToImage == null);

            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final article = articles[index];
                    return NewzFeedWidget(
                      article: article,
                    );
                  },
                  separatorBuilder: (context, index) => context.w10,
                  itemCount: articles.length),
            );
          }

          if (state is NewsErrorState) {
            return Center(
              child: Text(state.error.toString()),
            );
          }

          return Container();
        },
      ),
    );
  }
}
