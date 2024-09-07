import 'dart:io';

import 'package:dio/dio.dart';

class Constants {
  static final isWindows = Platform.isWindows;
  static const baseUrlAuth = 'https://newsapi.org';

  static dioOptions() => BaseOptions(
        validateStatus: (int? status) {
          return status != null;
          // return status != null && status >= 200 && status < 300;
        },
      );
}
