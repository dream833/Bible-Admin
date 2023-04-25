// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CTextField extends StatelessWidget {
  const CTextField({
    this.controller,
    this.hint,
    super.key,
  });

  final controller;
  final hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30.w, 8.h, 30.h, 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white.withOpacity(
          0.2,
        ),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(
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
        ),
      ),
    );
  }
}

class CTextFieldFont extends StatelessWidget {
  const CTextFieldFont({
    this.controller,
    this.hint,
    super.key,
  });

  final controller;
  final hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30.w, 8.h, 30.h, 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white.withOpacity(
          0.2,
        ),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          fontFamily: "K010",
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
        ),
      ),
    );
  }
}
