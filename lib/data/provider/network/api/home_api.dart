import 'dart:io';

import 'package:clean_arc/data/provider/network/api_endpoint.dart';
import 'package:clean_arc/data/provider/network/api_request_representable.dart';

import '../api_provider.dart';

enum HomeApiType { fetchPost, fetchUser }

class HomeApi extends APIRequestRepresentable {
  final HomeApiType type;

  HomeApi._({required this.type});

  HomeApi.fetchPost() : this._(type: HomeApiType.fetchPost);
  HomeApi.fetchUser() : this._(type: HomeApiType.fetchUser);

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
        return '/users';
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
    return  endpoint + path;
  }
}
