import 'package:bible_admin/app/widgets/quick_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../views/views/alltopic_view_view.dart';
import '../controllers/dashboard_page_controller.dart';

class DashboardPageView extends GetView<DashboardPageController> {
  const DashboardPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 12.h,
            ),
            Container(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CQuickInfoChild(
                      onTap: () {
                        Get.to(AlltopicViewView(
                          isOT: false,
                        ));
                      },
                      title: "Manage topics in NT"),
                  CQuickInfoChild(
                      onTap: () {
                        Get.to(AlltopicViewView(
                          isOT: true,
                        ));
                      },
                      title: "Manage topics in OT"),
                  CQuickInfoChild(
                    onTap: () {
                      controller.addANewWriting();
                    },
                    title: "Add a new writing",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
