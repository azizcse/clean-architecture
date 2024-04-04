import 'package:clean_arc/core/local/localization_service.dart';
import 'package:clean_arc/core/route/app_route.dart';
import 'package:clean_arc/core/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/di/dependency.dart';

void main() {
  DependencyCreator.init();
  runApp(
    GetMaterialApp(
      theme: ThemeService.getLightTheme(),
      darkTheme: ThemeService.getDarkTheme(),
      themeMode: ThemeService().getThemeMode(),
      locale: LocalizationService.getLocal(),
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      defaultTransition: Transition.rightToLeft,
      debugShowCheckedModeBanner: false,
      initialRoute: CleanRoute.home,
      getPages: ClearPages.pages,
    ),
  );
}
