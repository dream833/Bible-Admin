// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CPTextField extends StatelessWidget {
  CPTextField({
    this.controller,
    this.hint,
    super.key,
  });

  final controller;
  final hint;
  var isPassHidden = true.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white.withOpacity(
            0.2,
          ),
        ),
        margin: EdgeInsets.fromLTRB(30.w, 8.h, 30.h, 8.h),
        child: TextField(
          obscureText: isPassHidden.value,
          controller: controller,
          style: GoogleFonts.varelaRound(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(18.w, 16.h, 18.h, 16.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: Colors.white,
                width: 3.sp,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.sp,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: Colors.white,
                width: 3.sp,
              ),
            ),
            hintText: hint ?? "",
            hintStyle: const TextStyle(
              color: Colors.white,
            ),
            suffixIcon: InkWell(
              onTap: () {
                isPassHidden(!isPassHidden.value);
              },
              child: Icon(
                isPassHidden.value ? Icons.lock : Icons.remove_red_eye,
                size: 20.sp,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
