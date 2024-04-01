import 'package:clean_arc/core/base/base_ui_state.dart';
import 'package:clean_arc/domain/entities/Post.dart';

class DetailUiState extends BaseUiState {
  const DetailUiState({
    required super.isLoading,
    required super.userMessage,
    required this.post,
  });

  final Post? post;

  factory DetailUiState.empty() {
    return const DetailUiState(
      isLoading: true,
      userMessage: null,
      post: null,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        userMessage,
      ];

  DetailUiState copyWith({
    bool? isLoading,
    String? userMessage,
    Post? post,
  }) {
    return DetailUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      post: post ?? this.post,
    );
  }
}
