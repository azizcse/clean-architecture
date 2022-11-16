import 'package:clean_arc/core/usecase/no_param_usecase.dart';

import '../entities/Post.dart';
import '../repositories/home_repository.dart';

class FetchPostUseCase extends NoParamUseCase<List<Post>> {
  HomeRepository _reo;

  FetchPostUseCase(this._reo);

  @override
  Future<List<Post>> execute() async {
    return _reo.getPost();
  }
}
