import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/extensions/context.dart';
import 'package:news_app/features/News/data/models/source_model.dart';
import 'package:news_app/features/News/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/News/presentation/pages/source_news_page.dart';

class SourceWidget extends StatefulWidget {
  const SourceWidget({super.key});

  @override
  State<SourceWidget> createState() => _SourceWidgetState();
}

class _SourceWidgetState extends State<SourceWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      // color: context.primary,
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoadingState) {}

          if (state is SourcesLoadedState) {
            final list = state.listSources ?? [];

            if (list.isEmpty) {
              return const Center(
                child: Text('List is Empty'),
              );
            }

            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              child: SizedBox(
                height: 100,
                width: context.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 100,
                    width: 5000,
                    child: Wrap(
                      runSpacing: 0.0,
                      spacing: 10.0,
                      direction: Axis.horizontal,
                      children: list
                          .map((source) => RawChip(
                                backgroundColor:
                                    context.focus?.withOpacity(0.1),
                                side: context.sidenone,
                                label: Text(source.name.toString()),
                                onPressed: () => onMoveTofactorPage(source),
                              ))
                          .toList(),
                    ),
                  ),
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
      ),
    );
  }

  onMoveTofactorPage(SourceModel source) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SourceNewsPage(
              sourceModel: source,
            )));
  }
}
