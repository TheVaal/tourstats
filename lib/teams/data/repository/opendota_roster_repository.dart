import 'package:tourstats/core/data/datasource/opendota_datasource.dart';
import 'package:tourstats/core/data/dto/teamplayer_dto.dart';
import 'package:tourstats/core/domain/utils/result.dart';
import 'package:tourstats/teams/domain/model/team_player.dart';
import 'package:tourstats/teams/domain/repository/remote_roster_repository.dart';

class OpendotaRosterRepository extends RemoteRosterRepository {

  OpendotaDataSource datasource;
  OpendotaRosterRepository({required this.datasource});
  @override
  Future<Result<List<TeamPlayer>>> fetchPlayers(String teamId) async {
    Result<List<TeamPlayerDto>> response = await datasource.fetchPlayers(teamId);
    switch (response) {
      case Ok<List<TeamPlayerDto>>():
        
        return Result.onSuccess(
          response.value
            .map<TeamPlayer>(
              (dto)=> dto.toModel()
            ).toList()
          );
      case Error<List<TeamPlayerDto>>():
        return Result.onError(response.error);
    }
  }
}