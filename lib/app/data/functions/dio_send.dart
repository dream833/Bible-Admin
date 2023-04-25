// ignore_for_file: library_prefixes

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as DIO;

import '../cons/app_cons.dart';

Future<DIO.Response<dynamic>> dioPost(
    {bool? isPost,
    dynamic data,
    required String endUrl,
    bool? sendFile}) async {
  var dio = DIO.Dio();
  sendFile ?? false
      ? dio.options.headers["Content-Type"] = "multipart/form-data"
      : null;

  if (isPost ?? true) {
    var response = await dio.post(
      "$BASE_URL$endUrl",
      data: data,
      options: DIO.Options(
        validateStatus: (status) => true,
        sendTimeout: sendTimeout,
        receiveTimeout: receiveTimeout,
      ),
    );
    isDebugMode
        ? log(
            "\n\n${isPost ?? true ? 'POST:' : 'PUT'} $endUrl\nSTATUS CODE: ${response.statusCode}\n${jsonEncode(response.data)}\n\n")
        : null;
    return response;
  } else {
    var response = await dio.put(
      endUrl,
      data: data,
      options: DIO.Options(
        validateStatus: (status) => true,
        sendTimeout: sendTimeout,
        receiveTimeout: receiveTimeout,
      ),
    );
    isDebugMode
        ? log(
            "\n\n${isPost ?? true ? 'POST:' : 'PUT'} $endUrl\nSTATUS CODE: ${response.statusCode}\n${jsonEncode(response.data)}\n\n")
        : null;
    return response;
  }
}
