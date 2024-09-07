import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/registery/initialize.dart';
import 'package:news_app/features/Themes/DarkTheme.dart';
import 'package:news_app/features/Themes/LightTheme.dart';
import 'package:news_app/features/Themes/theme_bloc.dart';
import 'package:news_app/splash.dart';

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  @override
  Widget build(BuildContext context) => buildProvider();

  Widget buildProvider() => MultiBlocProvider(
      providers: InitializeBlocs.providers, child: buildTheme());

  Widget buildTheme() =>
      BlocBuilder<ThemeBloc, bool>(builder: (context, state) {
        log('$state');

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: state ? newzDarkTheme(context) : newzLightTheme(context),
          home: const SplashScreen(),
        );
      });
}
