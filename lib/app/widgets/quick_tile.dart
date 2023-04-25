// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CQuickInfoChild extends StatelessWidget {
  String? title;
  VoidCallback? onIconTap;
  VoidCallback? onTap;
  CQuickInfoChild({
    this.title,
    this.onIconTap,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12.sp),
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
          color: const Color(0xff38346c),
          borderRadius: BorderRadius.circular(12.r)),
      child: ListTile(
        onTap: () {
          onTap != null ? onTap!() : null;
        },
        contentPadding: EdgeInsets.fromLTRB(12.sp, 0, 12.sp, 0),
        title: Text(
          title ?? "",
          style: GoogleFonts.varelaRound(
            color: Colors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: InkWell(
          onTap: () {
            onIconTap != null ? onIconTap!() : null;
          },
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: Padding(
              padding: EdgeInsets.all(8.sp),
              child: Icon(
                Icons.navigate_next_sharp,
                size: 18.sp,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
