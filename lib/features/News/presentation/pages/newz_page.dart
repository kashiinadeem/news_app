import 'package:flutter/material.dart';
import 'package:news_app/core/extensions/context.dart';
import 'package:news_app/features/News/presentation/widgets/AppBar/new_app_bar.dart';
import 'package:news_app/features/News/presentation/widgets/Body/newz_body.dart';
import 'package:news_app/features/News/presentation/widgets/BottomBar/newz_bottom_bar.dart';

class NewzPage extends StatefulWidget {
  const NewzPage({super.key});

  @override
  State<NewzPage> createState() => _NewzPageState();
}

class _NewzPageState extends State<NewzPage> {
  int currentIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: currentIndex);

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(context.width, 80), child: const NewzAppBar()),
      body: NewzBody(
        onChangeIndex: onPageChanged,
        pageController: pageController,
      ),
      bottomNavigationBar: NewzBottomBar(
        currentIndex: currentIndex,
        onChangeIndex: onPageChanged,
      ),
    );
  }

  onPageChanged(int p1) {
    setState(() {
      currentIndex = p1;
    });

    pageController.jumpToPage(p1);
  }
}
