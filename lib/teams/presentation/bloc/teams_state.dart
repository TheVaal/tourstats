part of 'teams_bloc.dart';

class TeamsState extends Equatable {
  final bool isLoading;
  final List<TeamUi> list;
  final String error;

  const TeamsState._({
    this.isLoading = true, 
    this.list = const [],
    this.error = '',
  });

  TeamsState copyWith({
    List<TeamUi>? list, 
    bool? isLoading,
    String? error,
  }) {
    return TeamsState._(
      list: list ?? this.list,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  factory TeamsState.initial() => const TeamsState._();
  factory TeamsState.loaded(List<TeamUi> list) => TeamsState._(list: list, isLoading: false);
  factory TeamsState.error(TeamsState currentState, String error) =>
      TeamsState._(list: currentState.list, isLoading: false, error: error);

  @override
  List<Object?> get props => [isLoading, list, error];
}