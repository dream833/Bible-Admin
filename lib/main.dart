import 'package:bible_admin/app/data/cons/app_cons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  setPathUrlStrategy();
  runApp(
    ScreenUtilInit(
        designSize: ScreenUtil.defaultSize,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: APP_CONS.APP_NAME,
            theme: ThemeData(
              fontFamily: "K010",
              primarySwatch: PRIMARY_COLOR,
            ),
            initialRoute: AppPages.INITIAL,
            debugShowCheckedModeBanner: false,
            getPages: AppPages.routes,
          );
        }),
  );
}
