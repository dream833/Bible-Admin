import 'package:bible_admin/app/widgets/button.dart';
import 'package:bible_admin/app/widgets/passwordfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo.shade300,
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Get.width,
                  height: 0,
                ),
                Text(
                  "ADMIN PANEL",
                  style: GoogleFonts.varelaRound(
                    color: Colors.white,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  width: Get.width,
                  child: CPTextField(
                    controller: controller.emailController,
                    hint: "Email",
                  ),
                ),
                SizedBox(
                  width: Get.width,
                  child: CPTextField(
                    controller: controller.passController,
                    hint: "Password",
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                    width: Get.width,
                    child: CButton(
                      onTap: () {
                        controller.login();
                      },
                      isLoading: false.obs,
                      title: "Login",
                    ))
              ],
            ),
          ),
        ));
  }
}
