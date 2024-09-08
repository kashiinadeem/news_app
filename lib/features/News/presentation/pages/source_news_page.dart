import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/extensions/context.dart';
import 'package:news_app/core/registery/dep_injections.dart';
import 'package:news_app/features/News/data/models/source_model.dart';
import 'package:news_app/features/News/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/News/presentation/widgets/Body/newz_feed_widget.dart';

class SourceNewsPage extends StatefulWidget {
  final SourceModel? sourceModel;

  const SourceNewsPage({super.key, this.sourceModel});

  @override
  State<SourceNewsPage> createState() => _SourceNewsPageState();
}

class _SourceNewsPageState extends State<SourceNewsPage> {
  final bloc = getIt<NewsBloc>();

  @override
  void initState() {
    log(widget.sourceModel!.id.toString());
    bloc.add(GetArticlesEvent(category: widget.sourceModel?.id));
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
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

            return ListView.separated(
              padding: context.p20,
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final article = articles[index];
                return NewzFeedWidget(article: article);
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: articles.length,
            );
          }

          return Container();
        },
      ),
    );
  }
}
