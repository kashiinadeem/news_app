import 'package:flutter/material.dart';
import 'package:news_app/features/News/presentation/functions/page_view_functions.dart';

class NewzBody extends StatelessWidget with PageViewFunctions {
  final Function(int) onChangeIndex;
  final PageController pageController;
  NewzBody(
      {super.key, required this.onChangeIndex, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: pageController,
        onPageChanged: onChangeIndex,
        itemBuilder: (context, index) {
          return pages[index];
        });
  }
}
