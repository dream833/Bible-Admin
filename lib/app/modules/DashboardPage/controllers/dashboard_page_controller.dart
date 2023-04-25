// ignore_for_file: library_prefixes

import 'package:bible_admin/app/data/functions/dio_get.dart';
import 'package:bible_admin/app/data/functions/dio_send.dart';
import 'package:bible_admin/app/data/models/get_all_chapters.dart';
import 'package:bible_admin/app/views/views/add_writings_view.dart';
import 'package:bible_admin/app/widgets/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/get_all_part_model.dart';

class DashboardPageController extends GetxController {
  var chapterTextController = TextEditingController();

  var getAllPart = GetAllPart().obs;
  var getAllChapter = GetAllChapter().obs;
  var isAddTopicButtonLoading = false.obs;
  var selectedTopic = "NO NAME".obs;
  var selectedChapter = "1".obs;

  Future getAWriting(String topic, String chapter, bool isOT) async {
    var response = await dioPost(
        endUrl: "/api/v1/writings_${isOT ? 'ot' : 'nt'}/fetchone",
        data: {"topic": topic, "chapter": chapter});

    if (response.statusCode == 200 &&
        response.data["data"]["writings"] != null) {}
    return;
  }

  Future<GetAllPart> getAll(bool isOT) async {
    getAllPart(GetAllPart.fromJson({}));
    var response = await dioGet("/api/v1/parts_${isOT ? 'ot' : 'nt'}/fetchall");
    getAllPart(GetAllPart.fromJson(response.data));

    if (getAllPart.value.data!.isEmpty) {
      selectedTopic("");
      SHOW_SNACKBAR(
          text: "Please add a topic before adding a writing", isSuccess: false);
    } else {
      selectedTopic(getAllPart.value.data!.first.name);
    }

    return getAllPart.value;
  }

  Future<GetAllChapter> getAllChapters(String topic, bool isOT) async {
    getAllChapter(GetAllChapter.fromJson({}));
    var response = await dioPost(
        endUrl: "/api/v1/chapters_${isOT ? 'ot' : 'nt'}/fetchall",
        data: {"topic": topic});
    getAllChapter(GetAllChapter.fromJson(response.data));
    return getAllChapter.value;
  }

  Future deleteAPart(bool isOT, String partName) async {
    await dioPost(
      endUrl: "/api/v1/parts_${isOT ? 'ot' : 'nt'}/delete",
      data: {
        "name": partName,
      },
    );
    getAll(isOT);
  }

  Future addChapter(String partName, String chapterName, bool isOT) async {
    await dioPost(
      endUrl: "/api/v1/chapters_${isOT ? 'ot' : 'nt'}/add",
      data: {"chapter": chapterName, "topic": partName},
    );
    return;
  }

  Future deleteChapter(String partName, String chapterName, bool isOT) async {
    await dioPost(
      endUrl: "/api/v1/chapters_${isOT ? 'ot' : 'nt'}/delete",
      data: {"chapter": chapterName, "topic": partName},
    );
    return;
  }

  Future addAPart(bool isOT, String partName) async {
    isAddTopicButtonLoading(true);
    var response = await dioPost(
      endUrl: "/api/v1/parts_${isOT ? 'ot' : 'nt'}/add",
      data: {
        "name": partName,
      },
    );

    isAddTopicButtonLoading(false);
    Get.back();
    if (response.statusCode == 200) {
      SHOW_SNACKBAR(text: "New Topic added");
    } else {
      SHOW_SNACKBAR(
        text: "Topic added failed",
        isSuccess: false,
      );
    }

    getAll(isOT);
  }

  void addANewWriting() {
    Get.defaultDialog(
        title: "Type",
        titleStyle: GoogleFonts.varelaRound(),
        middleTextStyle: GoogleFonts.varelaRound(),
        middleText: "Select a Testament Type",
        actions: [
          InkWell(
            onTap: () {
              selectTopic(isOT: true);
            },
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(8.sp),
                child: Text(
                  "   OT   ",
                  style: GoogleFonts.varelaRound(),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 8.sp,
          ),
          InkWell(
            onTap: () async {
              selectTopic(isOT: false);
            },
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(8.sp),
                child: Text(
                  "   NT   ",
                  style: GoogleFonts.varelaRound(),
                ),
              ),
            ),
          ),
        ]);
  }

  void selectTopic({required bool isOT}) async {
    Get.back();
    await getAll(isOT);

    Get.defaultDialog(
        title: "Topic",
        titleStyle: GoogleFonts.varelaRound(),
        middleText: "Select a topic",
        content: InkWell(
          onTap: () {
            showTopicList(isOT: isOT);
          },
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(8.sp),
              child: Obx(
                () => Text(
                  selectedTopic.value,
                  style: TextStyle(
                    fontFamily: "K010",
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.all(8.sp),
              child: Text(
                "Cancel",
                style: GoogleFonts.varelaRound(),
              ),
            ),
          ),
          SizedBox(
            width: 8.sp,
          ),
          InkWell(
            onTap: () async {
              selectChapter(isOT: isOT);
            },
            child: Padding(
              padding: EdgeInsets.all(8.sp),
              child: Text(
                "Next",
                style: GoogleFonts.varelaRound(),
              ),
            ),
          ),
        ]);
  }

  void showTopicList({required bool isOT}) async {
    await getAll(isOT);
    Get.defaultDialog(
      title: "Select topic",
      titleStyle: GoogleFonts.varelaRound(),
      middleText: "Select a topic",
      content: SizedBox(
        height: Get.height * 0.8,
        child: Scaffold(
          body: Obx(() => ListView.builder(
              shrinkWrap: true,
              itemCount: getAllPart.value.data != null
                  ? getAllPart.value.data!.length
                  : 0,
              itemBuilder: (context, index) {
                var data = getAllPart.value.data![index];

                return Card(
                  child: ListTile(
                    onTap: () {
                      selectedTopic(
                        data.name ?? "NO_NAME",
                      );
                      Get.back();
                    },
                    title: Text(
                      data.name ?? "NO_NAME",
                      style: TextStyle(
                        fontFamily: "K010",
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                );
              })),
        ),
      ),
    );
  }

  void selectChapter({required bool isOT}) async {
    Get.back();
    await getAllChapters(selectedTopic.value, isOT);

    Get.defaultDialog(
        title: "Chapter",
        titleStyle: GoogleFonts.varelaRound(),
        middleText: "Select a chapter",
        content: InkWell(
          onTap: () {
            showChapterList(selectedTopic.value, isOT);
          },
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(8.sp),
              child: Obx(
                () => Text(
                  selectedChapter.value,
                  style: TextStyle(
                    fontFamily: "K010",
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.all(8.sp),
              child: Text(
                "Cancel",
                style: GoogleFonts.varelaRound(),
              ),
            ),
          ),
          SizedBox(
            width: 8.sp,
          ),
          InkWell(
            onTap: () async {
              Get.off(AddWritingsView(
                topic: selectedTopic.value,
                chapter: selectedChapter.value,
                isOT: isOT,
              ));
            },
            child: Padding(
              padding: EdgeInsets.all(8.sp),
              child: Text(
                "Next",
                style: GoogleFonts.varelaRound(),
              ),
            ),
          ),
        ]);
  }

  void showChapterList(String topic, bool isOT) async {
    await getAllChapters(selectedTopic.value, isOT);
    Get.defaultDialog(
      title: "Select chapter",
      titleStyle: GoogleFonts.varelaRound(),
      middleText: "Select a chapter",
      content: SizedBox(
        height: Get.height * 0.8,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: chapterTextController,
                          style: GoogleFonts.varelaRound(),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(8),
                            hintStyle: GoogleFonts.varelaRound(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await addChapter(selectedTopic.value,
                                  chapterTextController.text.trim(), isOT)
                              .then((value) async {
                            await getAllChapters(topic, isOT);
                          });
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Add",
                              style: GoogleFonts.varelaRound(),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: getAllChapter.value.data != null
                        ? getAllChapter.value.data!.length
                        : 0,
                    itemBuilder: (context, index) {
                      var data = getAllChapter.value.data![index];

                      return Card(
                        child: ListTile(
                          trailing: ClipOval(
                            child: InkWell(
                              onTap: () {
                                SHOW_SNACKBAR(
                                    text:
                                        "Please long press to delete a chapter",
                                    isSuccess: false);
                              },
                              onLongPress: () async {
                                await deleteChapter(selectedTopic.value,
                                        data.name ?? "".trim(), isOT)
                                    .then((value) async {
                                  await getAllChapters(topic, isOT);
                                });
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
                          onTap: () {
                            selectedChapter(
                              data.name ?? "1",
                            );
                            Get.back();
                          },
                          title: Text(
                            data.name ?? "1",
                            style: TextStyle(
                              fontFamily: "K010",
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
