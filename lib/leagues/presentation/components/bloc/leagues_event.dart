part of 'leagues_bloc.dart';

sealed class LeaguesEvent {
  const LeaguesEvent();
}

final class FetchLeaguesData extends LeaguesEvent {}