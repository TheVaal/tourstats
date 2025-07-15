import 'package:tourstats/core/domain/utils/result.dart';
import 'package:tourstats/teams/domain/model/team.dart';

abstract class GetTeamsUseCase{
  Stream<Result<List<Team>>> fetchTeams();
}