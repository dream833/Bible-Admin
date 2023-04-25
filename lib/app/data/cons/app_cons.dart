// ignore_for_file: constant_identifier_names, non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

final getBox = GetStorage();
const String IS_LOGGED_IN = "is_logged_in";

const bool isDebugMode = true;
const int sendTimeout = 5000;
const int receiveTimeout = 5000;
const MaterialColor PRIMARY_COLOR = Colors.indigo;
const appVersion = 100;
const String BASE_URL = "http://159.89.164.125:25272";

class APP_CONS {
  static String APP_NAME = "Bible";
  static String IMAGES_F = "assets/images";
  static String ICONS_F = "assets/icons";
  static String LOTTIE_F = "assets/lottie";
}
