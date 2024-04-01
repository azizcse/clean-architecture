import 'package:clean_arc/ui/home/repository/home_repository_impl.dart';
import 'package:clean_arc/ui/home/usecase/fetch_post_use_case.dart';
import 'package:clean_arc/ui/controller/home/home_controller.dart';
import 'package:clean_arc/ui/home/presenter/home_presenter.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeRepositoryImpl());
    Get.lazyPut(() => FetchPostUseCase(Get.find<HomeRepositoryImpl>()));
    Get.lazyPut(() => HomeController(Get.find()));
    Get.lazyPut(() => HomePresenter(Get.find()));
  }
}
