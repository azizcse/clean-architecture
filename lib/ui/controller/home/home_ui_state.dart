import 'package:clean_arc/core/base/base_ui_state.dart';

import '../../../domain/entities/Post.dart';

class HomeUiState extends BaseUiState {
  const HomeUiState({
    required super.isLoading,
    required super.userMessage,
    required this.postList,
  });

  factory HomeUiState.empty() {
    return const HomeUiState(
      isLoading: true,
      userMessage: null,
      postList: [],
    );
  }

  final List<Post> postList;

  @override
  List<Object?> get props => [
        userMessage,
        isLoading,
        postList,
      ];

  HomeUiState copyWith({
    String? userMessage,
    bool? isLoading,
    List<Post>? postList,
  }) {
    return HomeUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      postList: postList ?? this.postList,
    );
  }
}
