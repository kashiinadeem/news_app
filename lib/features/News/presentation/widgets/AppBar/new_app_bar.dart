import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/extensions/context.dart';
import 'package:news_app/core/registery/dep_injections.dart';
import 'package:news_app/features/News/presentation/bloc/news_bloc.dart';
import 'package:news_app/newz_icons_icons.dart';

class NewzAppBar extends StatelessWidget {
  const NewzAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      title: Icon(
        NewzIcons.newz,
        color: context.primary,
        size: 100,
      ),
      actions: [
        Padding(
          padding: context.p10,
          child: const NewzSources(),
        )
      ],
    );
  }
}

class NewzSources extends StatefulWidget {
  const NewzSources({super.key});

  @override
  State<NewzSources> createState() => _NewzSourcesState();
}

class _NewzSourcesState extends State<NewzSources> {
  String selectedCountry = 'us';

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
          var list = state.listSources ?? [];

          if (list.isEmpty) {
            return const Center(
              child: Text('List is Empty'),
            );
          }

          final countries =
              list.map((source) => source.country).toList().toSet().toList();

          return SizedBox(
            height: 40,
            width: 120,
            child: DropdownButtonFormField(
                isDense: true,
                borderRadius: context.r10,
                menuMaxHeight: context.height * 0.4,
                decoration: const InputDecoration(
                  filled: false,
                  border: InputBorder.none,
                ),
                value: selectedCountry,
                items: countries
                    .map((country) => DropdownMenuItem(
                          value: country,
                          child: Text(country.toString().toUpperCase()),
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
  }
}
