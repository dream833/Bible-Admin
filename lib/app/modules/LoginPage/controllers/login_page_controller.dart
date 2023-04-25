import 'package:bible_admin/app/data/cons/app_cons.dart';
import 'package:bible_admin/app/widgets/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginPageController extends GetxController {
  var emailController = TextEditingController();
  var passController = TextEditingController();

  void login() {
    if ((emailController.text == "admin@gmail.com" &&
            passController.text == "pass") ||
        isDebugMode) {
      Get.offAllNamed(Routes.DASHBOARD_PAGE);
    } else {
      SHOW_SNACKBAR(
        text: "Invalid Email/Password",
        isSuccess: false,
      );
    }
  }
}
