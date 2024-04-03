import 'package:clean_arc/core/base/base_presenter.dart';
import 'package:clean_arc/data/cache/cache_service.dart';
import 'package:clean_arc/domain/remote/Post.dart';
import 'package:clean_arc/presentation/details/presenter/detail_ui_state.dart';
import 'package:clean_arc/presentation/details/usecase/detail_use_case.dart';
import 'package:get/get.dart';

class DetailPresenter extends BasePresenter<DetailUiState> {
  DetailPresenter(this._postDetailUseCase);

  final PostDetailUseCase _postDetailUseCase;
  final Obs<DetailUiState> uiState = Obs(DetailUiState.empty());
  final CacheService _cacheService = Get.find<CacheService>();

  @override
  void onInit() {
    super.onInit();
    _postDetailUseCase.execute(2);
    print(
        "On init called ------------------------------------${_cacheService.getUserName()}");
  }

  @override
  void onClose() {
    super.onClose();
    print("On close called ------------------------------------");
  }

  @override
  Future<void> addUserMessage(String message) {
    // TODO: implement addUserMessage
    throw UnimplementedError();
  }

  @override
  Future<void> toggleLoading({required bool loading}) {
    // TODO: implement toggleLoading
    throw UnimplementedError();
  }

  void fetchDetail(int i) async {
    Post post = await _postDetailUseCase.execute(i);
    print(post.toJson());
    uiState.value = uiState.value.copyWith(post: post);
  }
}
