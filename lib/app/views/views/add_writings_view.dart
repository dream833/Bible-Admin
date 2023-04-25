// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'dart:developer';

import 'package:bible_admin/app/modules/DashboardPage/controllers/dashboard_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/functions/dio_send.dart';
import '../../widgets/button.dart';
import '../../widgets/show_snackbar.dart';

class AddWritingsView extends GetView {
  String topic;
  String chapter;
  bool isOT;
  AddWritingsView({
    required this.topic,
    required this.chapter,
    required this.isOT,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var dashboardController = Get.put(DashboardPageController());
    dashboardController.getAWriting(topic, chapter, isOT);
    var text = TextEditingController();
    var currentVerse = 1.obs;

    return SafeArea(
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CButton(
                onTap: () async {
                  log(jsonEncode(
                    {
                      "topic": topic,
                      "chapter": chapter,
                      "number": currentVerse.value.toString(),
                      "writings": text.text,
                    },
                  ));
                  await dioPost(
                    endUrl: "/api/v1/writings_${isOT ? 'ot' : 'nt'}/add",
                    data: {
                      "topic": topic,
                      "chapter": chapter,
                      "number": currentVerse.value.toString(),
                      "writings": text.text,
                    },
                  );
                  SHOW_SNACKBAR(text: "Writing added to your topic");
                },
                title: "Save",
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  InkWell(
                    onTap: () {
                      currentVerse.value > 0 ? currentVerse-- : null;
                    },
                    child: const Card(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.remove),
                    )),
                  ),
                  const Spacer(),
                  Obx(() => Text(
                        "Current selected Verse ${currentVerse.value}",
                        style: GoogleFonts.varelaRound(),
                      )),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      currentVerse++;
                    },
                    child: const Card(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.add),
                    )),
                  ),
                ]),
              ),
              TextFormField(
                controller: text,
                decoration: const InputDecoration(
                  hintText: "Please write your verse",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
