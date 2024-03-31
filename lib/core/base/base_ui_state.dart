import 'package:equatable/equatable.dart';

abstract class BaseUiState extends Equatable {
  const BaseUiState({
    required this.isLoading,
    required this.userMessage,
  });

  final bool isLoading;
  final String? userMessage;
}
