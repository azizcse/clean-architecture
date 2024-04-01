import 'package:clean_arc/core/usecase/param_usecase.dart';
import 'package:clean_arc/domain/entities/Post.dart';
import 'package:clean_arc/ui/details/presenter/detail_repository_impl.dart';

class PostDetailUseCase extends ParamUseCase<Post, int> {
  PostDetailUseCase(this._detailRepositoryImpl);

  final DetailRepositoryImpl _detailRepositoryImpl;

  @override
  Future<Post> execute(int param) async{
    return await _detailRepositoryImpl.getPostDetails(param);
  }
}
