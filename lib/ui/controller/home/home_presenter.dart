import 'package:clean_arc/core/base/base_presenter.dart';
import 'package:clean_arc/domain/usecases/fetch_post_use_case.dart';
import 'package:clean_arc/ui/controller/home/home_ui_state.dart';
import 'package:get/get.dart';

import '../../../domain/entities/Post.dart';

class HomePresenter extends BasePresenter<HomeUiState> {
  HomePresenter(this._fetchPostUseCase);

  final FetchPostUseCase _fetchPostUseCase;
  final Obs<HomeUiState> uiState = Obs(HomeUiState.empty());

  @override
  Future<void> addUserMessage(String message) async {
    uiState.value = uiState.value.copyWith(userMessage: message);
  }

  @override
  Future<void> toggleLoading({required bool loading}) async {
    uiState.value = uiState.value.copyWith(isLoading: !uiState.value.isLoading);
  }

  void doRequest() async {
    List<Post> posts = await _fetchPostUseCase.execute();
    uiState.value = uiState.value.copyWith(postList: posts);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  // TODO: implement onStart
  InternalFinalCallback<void> get onStart => super.onStart;
}
