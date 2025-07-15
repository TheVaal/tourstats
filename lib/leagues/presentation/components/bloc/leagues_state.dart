part of 'leagues_bloc.dart';

class LeaguesState extends Equatable {
  final bool isLoading;
  final String error;

    const LeaguesState._({
    this.isLoading = true, 
    this.error = '',
  });
 factory LeaguesState.initial() => const LeaguesState._();
  factory LeaguesState.error(LeaguesState currentState, String error) =>
    LeaguesState._(isLoading: false, error: error);
 @override
  List<Object?> get props => [isLoading, error];  
}