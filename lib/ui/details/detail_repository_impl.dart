import 'package:clean_arc/domain/entities/Post.dart';
import 'package:clean_arc/ui/details/detail_repository.dart';

import '../../data/provider/network/api/home_api.dart';

class DetailRepositoryImpl extends DetailRepository{
  @override
  Future<Post> getPostDetails(int postId) async{
    var response = await HomeApi.fetchPostDetails(postId).request();
    return Post.fromJson(response);
  }

}