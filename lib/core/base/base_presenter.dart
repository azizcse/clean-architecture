import 'package:clean_arc/core/base/base_ui_state.dart';
import 'package:get/get.dart';

abstract class BasePresenter<U extends BaseUiState> extends GetxController {
  Future<void> toggleLoading({required bool loading});
  Future<void> addUserMessage(String message);

}
class Obs<T> extends Rx<T> {
  Obs(super.initial);
}

