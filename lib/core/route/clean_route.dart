import 'package:clean_arc/ui/controller/home/home_binding.dart';
import 'package:clean_arc/ui/pages/home_page.dart';
import 'package:get/get.dart';

import '../../ui/pages/home_page_new.dart';

class CleanRoute {
  CleanRoute._();

  static const String home = '/home';
}

class ClearPages {
  ClearPages._();

  static final pages = [
    GetPage(
      name: CleanRoute.home,
      page: () => HomePageNew(),
      binding: HomeBinding(),
    )
  ];
}
