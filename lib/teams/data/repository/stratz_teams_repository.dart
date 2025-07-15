import 'package:tourstats/core/data/datasource/stratz_datasource.dart';
import 'package:tourstats/core/data/dto/team_dto.dart';
import 'package:tourstats/core/domain/utils/result.dart';
import 'package:tourstats/teams/domain/model/team.dart';
import 'package:tourstats/teams/domain/repository/remote_teams_repository.dart';

class StratzTeamsRepository extends RemoteTeamsRepository{
  StratzDatasource datasource;
  StratzTeamsRepository({required this.datasource});

  @override
  Future<Result<List<Team>>> fetchTeams() async {
    Result<List<TeamDto>> response = await datasource.fetchTeams();
    switch (response) {
      case Ok<List<TeamDto>>():
        return Result.onSuccess(
          response.value
            .map<Team>(
              (dto)=> dto.toModel()
            ).toList()
          );
      case Error<List<TeamDto>>():
        return Result.onError(response.error);
    }
  }
  
}