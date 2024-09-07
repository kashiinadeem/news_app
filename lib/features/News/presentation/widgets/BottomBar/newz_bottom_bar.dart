import 'package:flutter/material.dart';
import 'package:news_app/features/News/presentation/functions/bottom_bar_functions.dart';

class NewzBottomBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onChangeIndex;
  const NewzBottomBar(
      {super.key, required this.currentIndex, required this.onChangeIndex});

  @override
  State<NewzBottomBar> createState() => _NewzBottomBarState();
}

class _NewzBottomBarState extends State<NewzBottomBar> with BottomBarFunctions {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: widget.currentIndex,
        onTap: widget.onChangeIndex,
        items: items);
  }
}
