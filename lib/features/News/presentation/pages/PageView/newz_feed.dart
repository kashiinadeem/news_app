import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/extensions/context.dart';
import 'package:news_app/core/registery/dep_injections.dart';
import 'package:news_app/features/News/presentation/bloc/bloc.dart';
import 'package:news_app/features/News/presentation/pages/factor_source_page.dart';
import 'package:news_app/features/News/presentation/widgets/Body/headline_widget.dart';
import 'package:news_app/features/News/presentation/widgets/Body/source_widget.dart';

class NewzFeedPage extends StatelessWidget {
  const NewzFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        const NewzHeadlines(),
        context.h10,
        const SourceWidget(),
        context.h10,
        const FactorSourcePage()
      ],
    );
  }
}

class NewzHeadlines extends StatefulWidget {
  const NewzHeadlines({super.key});

  @override
  State<NewzHeadlines> createState() => _NewzHeadlinesState();
}

class _NewzHeadlinesState extends State<NewzHeadlines> {
  final bloc = getIt<NewsBloc>();

  @override
  void initState() {
    bloc.add(const GetArticlesEvent(country: 'us'));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NewzHeadlines oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
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

          return SizedBox(
            height: 280,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final article = articles[index];
                          return HeadlineWidget(
                            article: article,
                          );
                        },
                        separatorBuilder: (context, index) => context.w10,
                        itemCount: articles.length),
                  ),
                ],
              ),
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
    );
  }
}
