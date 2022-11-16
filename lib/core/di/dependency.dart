import 'package:clean_arc/data/epositories/home_repository_impl.dart';
import 'package:get/get.dart';

class DependencyCreator {
  static init() {
    Get.lazyPut(() => HomeRepositoryImpl());
  }
}
