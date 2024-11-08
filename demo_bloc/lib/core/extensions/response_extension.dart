import 'dart:io';

import 'package:dio/dio.dart';

extension ResponseExtension on Response {
  bool get isSuccess => statusCode == HttpStatus.ok;
  bool get isSuccessWithData => statusCode == HttpStatus.ok && data != null;
}
