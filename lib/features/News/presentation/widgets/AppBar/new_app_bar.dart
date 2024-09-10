import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/containers/blocs.dart';
import 'package:news_app/core/extensions/context.dart';
import 'package:news_app/features/News/data/models/source_model.dart';
import 'package:news_app/features/News/presentation/bloc/news_bloc.dart';
import 'package:news_app/newz_icons_icons.dart';

class NewzAppBar extends StatelessWidget {
  const NewzAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      title: Row(
        children: [
          Icon(
            NewzIcons.newz,
            color: context.primary,
            size: 100,
          ),
          Padding(
            padding: context.p10,
            child: const NewzSources(),
          )
        ],
      ),
    );
  }
}

class NewzSources extends StatefulWidget {
  const NewzSources({super.key});

  @override
  State<NewzSources> createState() => _NewzSourcesState();
}

class _NewzSourcesState extends State<NewzSources> {
  SourceModel? selectedCountry;

  @override
  void initState() {
    BlocProvider.of<NewsBloc>(context).add(const GetArticlesSourcesEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoadingState) {
          return Container();
        }

        if (state is SourcesLoadedState) {
          var list = state.listSources?.toSet().toList() ?? [];

          if (list.isEmpty) {
            return const Center(
              child: Text('List is Empty'),
            );
          }

          return SizedBox(
            width: 70,
            child: DropdownButtonFormField<SourceModel>(
                borderRadius: context.r10,
                menuMaxHeight: context.height * 0.4,
                decoration: InputDecoration(
                    filled: false,
                    border: InputBorder.none,
                    hintText: 'US',
                    hintStyle: context.b1,
                    constraints: BoxConstraints.loose(const Size(70, 40))),
                value: selectedCountry,
                items: list
                    .map((country) => DropdownMenuItem<SourceModel>(
                          value: country,
                          child: Text(
                            country.country.toString().toUpperCase(),
                            style: context.b1,
                          ),
                        ))
                    .toList(),
                onChanged: onCountryChanged),
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

  void onCountryChanged(value) {
    setState(() {
      selectedCountry = value;
    });

    final bloc = BlocProvider.of<SelectedCountry>(context);
    bloc.add(value);
  }
}
