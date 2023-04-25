// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void SHOW_SNACKBAR({int? duration, String? text, bool? isSuccess}) {
  final snackBar = GetSnackBar(
    icon: (isSuccess ?? true)
        ? const Icon(
            Icons.done,
            color: Colors.white,
          )
        : const Icon(
            Icons.cancel,
            color: Colors.white,
          ),
    backgroundColor: (isSuccess ?? true) ? Colors.green : Colors.red,
    duration: Duration(milliseconds: duration ?? 2500),
    messageText: Text(
      text ?? "",
      style: GoogleFonts.varelaRound(
        color: Colors.white,
      ),
    ),
  );
  Get.showSnackbar(snackBar);
}
