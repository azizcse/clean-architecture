import 'package:clean_arc/core/route/clean_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/di/dependency.dart';

void main() {
  DependencyCreator.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: CleanRoute.home,
    getPages: ClearPages.pages,
  ));
}
