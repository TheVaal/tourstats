part of 'teams_bloc.dart';

sealed class TeamsEvent {
  const TeamsEvent();
}

final class FetchTeamsData extends TeamsEvent {}

final class FetchRosterData extends TeamsEvent {
  final String teamId;
  
  FetchRosterData(this.teamId);

}