import 'package:get/get.dart';
import 'package:logger/logger.dart';

/**
 * GetX will keep this class always live in app lifecycle
 */
class CacheService extends GetxService {
  var logger = Logger(
    printer: PrettyPrinter(),
  );
  String? _username;

  @override
  void onInit() {
    super.onInit();
    print("Cache service is initialized");
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void setUserName(String name) {
    _username = name;
  }

  String? getUserName() {
    return _username;
  }
}
