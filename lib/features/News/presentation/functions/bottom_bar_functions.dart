import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/newz_icons_icons.dart';

mixin BottomBarFunctions {
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon: Icon(NewzIcons.feed_outlined),
        activeIcon: Icon(NewzIcons.feed),
        label: 'Newz Feed'),
    const BottomNavigationBarItem(
        icon: Icon(NewzIcons.search_outlined),
        activeIcon: Icon(NewzIcons.search),
        label: 'Newz Search'),
    // const BottomNavigationBarItem(
    //     icon: Icon(CupertinoIcons.pin),
    //     activeIcon: Icon(CupertinoIcons.pin_fill),
    //     label: 'Favourites'),
  ];
}
