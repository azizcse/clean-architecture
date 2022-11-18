import 'dart:io';

import 'package:clean_arc/data/provider/network/api_endpoint.dart';
import 'package:clean_arc/data/provider/network/api_request_representable.dart';

import '../api_provider.dart';

enum HomeApiType { fetchPost, fetchUser }

class HomeApi extends APIRequestRepresentable {
  final HomeApiType type;
  final int? postId;

  HomeApi._({required this.type, this.postId});

  HomeApi.fetchPost() : this._(type: HomeApiType.fetchPost);

  HomeApi.fetchPostDetails(int postId)
      : this._(type: HomeApiType.fetchUser, postId: postId);

  @override
  get body => null;

  @override
  String get endpoint => APIEndpoint.newsapi;

  @override
  Map<String, String>? get headers =>
      {HttpHeaders.contentTypeHeader: 'application/json'};

  @override
  HTTPMethod get method => HTTPMethod.get;

  @override
  String get path {
    switch (type) {
      case HomeApiType.fetchPost:
        return "/posts";
      case HomeApiType.fetchUser:
        return '/posts/$postId';
    }
  }

  @override
  Map<String, String>? get query => null;

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url {
    print("Url : $endpoint $path");
    return endpoint + path;
  }
}
