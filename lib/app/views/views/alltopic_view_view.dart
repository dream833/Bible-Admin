// ignore_for_file: must_be_immutable

import 'package:bible_admin/app/modules/DashboardPage/controllers/dashboard_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/quick_tile.dart';
import 'add_new_topic_view.dart';

class AlltopicViewView extends GetView {
  AlltopicViewView({
    Key? key,
    required this.isOT,
  }) : super(key: key);
  bool isOT;
  @override
  Widget build(BuildContext context) {
    var dashboardController = Get.put(DashboardPageController());
    dashboardController.getAll(isOT);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Topics of ${isOT ? 'OT' : 'NT'} ',
          style: GoogleFonts.varelaRound(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CQuickInfoChild(
                  onTap: () {
                    Get.defaultDialog(
                        title: "",
                        backgroundColor: Colors.transparent,
                        titlePadding: const EdgeInsets.all(0),
                        contentPadding: const EdgeInsets.all(0),
                        content: AddNewTopicView(
                          isOT: isOT,
                        ));
                  },
                  title: "Add a new ${isOT ? 'OT' : 'NT'} Part"),
              const Divider(),
              Obx(() {
                if (dashboardController.getAllPart.value.data != null) {
                  return Wrap(
                    children: dashboardController.getAllPart.value.data!
                        .map(
                          (data) => Card(
                            margin: EdgeInsets.all(3.sp),
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(12.sp, 8.sp, 0.sp, 8.sp),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    data.name ?? "",
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontFamily: "K010",
                                      fontSize: 14.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 18.sp,
                                  ),
                                  SizedBox(
                                    width: 35.sp,
                                    child: Row(
                                      children: [
                                        ClipOval(
                                          child: InkWell(
                                            onTap: () {
                                              dashboardController.deleteAPart(
                                                isOT,
                                                data.name ?? "",
                                              );
                                            },
                                            child: Container(
                                              height: 25.sp,
                                              width: 25.sp,
                                              padding: EdgeInsets.all(4.sp),
                                              color: Colors.red,
                                              child: Center(
                                                child: Icon(
                                                  Icons.delete,
                                                  size: 15.sp,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  );
                } else {
                  return const SizedBox();
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
