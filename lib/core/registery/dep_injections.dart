import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initailizeDep() async {
  getIt.registerSingleton<Dio>(Dio());
}
