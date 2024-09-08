import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/extensions/context.dart';
import 'package:news_app/core/registery/dep_injections.dart';
import 'package:news_app/features/News/data/models/source_model.dart';
import 'package:news_app/features/News/presentation/bloc/bloc.dart';
import 'package:news_app/features/News/presentation/widgets/Body/newz_feed_widget.dart';

class FactorScaffold extends StatelessWidget {
  final bool? isScrollable;
  final SourceModel? sourceModel;

  const FactorScaffold({super.key, this.isScrollable, this.sourceModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Articles',
          style: context.h2,
        ),
      ),
      body: FactorSourcePage(
        isScrollable: isScrollable,
      ),
    );
  }
}

class FactorSourcePage extends StatefulWidget {
  final bool? isScrollable;
  const FactorSourcePage({
    super.key,
    this.isScrollable,
  });

  @override
  State<FactorSourcePage> createState() => _FactorSourcePageState();
}

class _FactorSourcePageState extends State<FactorSourcePage> {
  final bloc = getIt<NewsBloc>();

  @override
  void initState() {
    bloc.add(const SearchArticlesEvent(query: 'us'));

    super.initState();
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
            physics: widget.isScrollable ?? false
                ? const AlwaysScrollableScrollPhysics()
                : const NeverScrollableScrollPhysics(),
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
