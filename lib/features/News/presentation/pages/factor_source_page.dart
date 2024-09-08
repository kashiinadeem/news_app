import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/extensions/context.dart';
import 'package:news_app/core/registery/dep_injections.dart';
import 'package:news_app/features/News/data/models/source_model.dart';
import 'package:news_app/features/News/presentation/bloc/bloc.dart';
import 'package:news_app/features/News/presentation/widgets/Body/newz_feed_widget.dart';

class FactorSourcePage extends StatelessWidget {
  final NewsBloc homeNewzBloc;
  const FactorSourcePage({
    super.key,
    required this.homeNewzBloc,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      bloc: homeNewzBloc,
      builder: (context, state) {
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
            physics: const NeverScrollableScrollPhysics(),
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
    );
  }
}
