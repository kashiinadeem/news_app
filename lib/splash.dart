import 'package:flutter/material.dart';
import 'package:news_app/config/builders/page_builder.dart';
import 'dart:async';

import 'package:news_app/core/extensions/context.dart';
import 'package:news_app/features/News/presentation/pages/newz_page.dart';
import 'package:news_app/newz_icons_icons.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'SplashScreen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Timer? timer;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800))
      ..forward();
    var duration = const Duration(milliseconds: 500);
    timer = Timer(
        duration, RouteAnim(route: const NewzPage(), context: context).goPOP);
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Icon(
            NewzIcons.newz,
            color: context.background,
            size: 150,
          ))
        ],
      ),
    );
  }
}
