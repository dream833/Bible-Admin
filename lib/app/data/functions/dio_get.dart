// ignore_for_file: library_prefixes

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as DIO;

import '../cons/app_cons.dart';

Future<DIO.Response<dynamic>> dioGet(String endUrl) async {
  var dio = DIO.Dio();
  var response = await dio.get(
    "$BASE_URL$endUrl",
    options: DIO.Options(
      validateStatus: (status) => true,
      sendTimeout: sendTimeout,
      receiveTimeout: receiveTimeout,
    ),
  );
  isDebugMode
      ? log(
          "\n\nGET: $endUrl\nSTATUS CODE: ${response.statusCode}\n${jsonEncode(response.data)}\n\n")
      : null;
  return response;
}
