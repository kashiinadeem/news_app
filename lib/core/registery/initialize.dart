import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/containers/blocs.dart';
import 'package:news_app/core/registery/dep_injections.dart';
import 'package:news_app/features/News/presentation/bloc/bloc.dart';
import 'package:news_app/features/Themes/theme_bloc.dart';

class InitializeBlocs {
  static List<BlocProvider> providers = [
    BlocProvider<ThemeBloc>(create: (context) => getIt()),
    BlocProvider<NewsBloc>(create: (context) => getIt()),
    BlocProvider<SelectedCountry>(create: (context) => getIt()),
  ];
}
