import 'package:clean_arc/core/base/base_presenter.dart';
import 'package:clean_arc/ui/details/detail_ui_state.dart';
import 'package:clean_arc/ui/details/detail_use_case.dart';


class DetailPresenter extends BasePresenter<DetailUiState> {
  DetailPresenter(this._postDetailUseCase);

  final PostDetailUseCase _postDetailUseCase;
  final Obs<DetailUiState> uiState = Obs(DetailUiState.empty());

  @override
  void onInit() {
    super.onInit();
    _postDetailUseCase.execute(2);
    print("On init called ------------------------------------");
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
}
