import 'package:clean_arc/ui/home/di/home_binding.dart';
import 'package:clean_arc/ui/details/ui/item_details_page.dart';
import 'package:clean_arc/ui/details/di/post_detail_binding.dart';

import 'package:get/get.dart';

import '../../ui/home/ui/home_page_new.dart';



class CleanRoute {
  CleanRoute._();

  static const String home = '/home';
  static const String detail = '/detail';
}

class ClearPages {
  ClearPages._();

  static final pages = [
    GetPage(
      name: CleanRoute.home,
      page: () => HomePageNew(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: CleanRoute.detail,
      page: () => ItemDetailPage(),
      binding: PostDetailBinding(),
    )
  ];
}
