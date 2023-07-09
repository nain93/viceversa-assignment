import 'dart:io';

import 'package:dio/dio.dart';

const serviceKey =
    'P8E0iGFiHf%2BwyIMjSoS7CJZ3fGCu3qd5Chqsl86u0XqnSqHP%2Faq%2Bb5nDOCS1%2FnYizA6fZXVjWmk%2FgLgMaYaV%2BQ%3D%3D';

String mobileOS = Platform.isIOS ? "IOS" : "AND";

Dio get dio {
  BaseOptions options = BaseOptions(
    baseUrl: 'https://apis.data.go.kr/B551011/PhotoGalleryService1',
  );
  Dio dio = Dio(options);

  return dio;
}
