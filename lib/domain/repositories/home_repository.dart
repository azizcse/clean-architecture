import '../entities/Post.dart';
import '../entities/user.dart';

abstract class HomeRepository{
  Future<List<User>> getUsers();
  Future<List<Post>> getPost();
}