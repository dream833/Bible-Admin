// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CButton extends StatelessWidget {
  CButton({
    this.onTap,
    this.isLoading,
    this.title,
    super.key,
  });
  Rx<bool>? isLoading;
  VoidCallback? onTap;
  String? title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap != null ? onTap!() : null,
      child: Container(
        height: 40.h,
        margin: EdgeInsets.fromLTRB(30.w, 8.h, 30.h, 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: Colors.white,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(4, 2.0),
              blurRadius: 6.0,
            ),
          ],
          color: Colors.indigo.shade100,
        ),
        child: Center(
          child: isLoading != null
              ? Obx(
                  () => (isLoading != null && !(isLoading!.value))
                      ? Text(
                          title ?? "",
                          style: GoogleFonts.varelaRound(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        )
                      : const CircularProgressIndicator(
                          color: Colors.black,
                        ),
                )
              : Text(
                  title ?? "",
                  style: GoogleFonts.varelaRound(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
        ),
      ),
    );
  }
}
