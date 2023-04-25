// ignore_for_file: must_be_immutable

import 'package:bible_admin/app/modules/DashboardPage/controllers/dashboard_page_controller.dart';
import 'package:bible_admin/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/textfield.dart';

class AddNewTopicView extends GetView {
  AddNewTopicView({required this.isOT, Key? key}) : super(key: key);
  bool isOT;

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var dashBoardController = Get.put(DashboardPageController());
    return Material(
      color: Colors.transparent,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xff38346c),
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Add Topic",
                style: GoogleFonts.varelaRound(
                  color: Colors.white,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                width: Get.width,
                child: CTextFieldFont(
                  controller: nameController,
                  hint: "Name",
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              CButton(
                isLoading: dashBoardController.isAddTopicButtonLoading,
                title: "Add",
                onTap: () {
                  dashBoardController.addAPart(
                      isOT, nameController.text.trim());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
