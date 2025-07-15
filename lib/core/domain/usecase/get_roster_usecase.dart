import 'package:tourstats/core/domain/utils/result.dart';
import 'package:tourstats/teams/domain/model/team_player.dart';

abstract class GetRosterUseCase{
  Stream<Result<List<TeamPlayer>>> fetchRoster(String teamId);
}