import 'package:clean_arc/core/base/base_presenter.dart';
import 'package:clean_arc/data/cache/cache_service.dart';
import 'package:clean_arc/domain/remote/Post.dart';
import 'package:clean_arc/presentation/home/presenter/home_ui_state.dart';
import 'package:clean_arc/presentation/home/usecase/fetch_post_use_case.dart';
import 'package:get/get.dart';

class HomePresenter extends BasePresenter<HomeUiState> {
  HomePresenter(this._fetchPostUseCase);

  final FetchPostUseCase _fetchPostUseCase;
  final Obs<HomeUiState> uiState = Obs(HomeUiState.empty());
  final CacheService _cacheService = Get.find<CacheService>();

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
    _cacheService.setUserName("Aziz");
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
