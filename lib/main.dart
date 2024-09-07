import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/core/registery/dep_injections.dart';
import 'package:news_app/startApp.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await initailizeDep();

  runApp(const StartApp());
}
