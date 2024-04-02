import 'package:clean_arc/core/usecase/no_param_usecase.dart';
import 'package:clean_arc/domain/remote/Post.dart';

import '../repository/home_repository.dart';

class FetchPostUseCase extends NoParamUseCase<List<Post>> {
  HomeRepository _reo;

  FetchPostUseCase(this._reo);

  @override
  Future<List<Post>> execute() async {
    return _reo.getPost();
  }

  Future<Post?> getPostDetails(int postId) async {
    return _reo.getPostDetails(postId);
  }
}
