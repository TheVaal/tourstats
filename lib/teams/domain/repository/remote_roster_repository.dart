import 'package:tourstats/core/domain/utils/result.dart';
import 'package:tourstats/teams/domain/model/team_player.dart';

abstract class RemoteRosterRepository {
  Future<Result<List<TeamPlayer>>> fetchPlayers(String teamId);
}