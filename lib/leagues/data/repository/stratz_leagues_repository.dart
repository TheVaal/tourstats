import 'package:tourstats/core/data/datasource/stratz_datasource.dart';
import 'package:tourstats/core/data/dto/league_dto.dart';
import 'package:tourstats/core/domain/utils/result.dart';
import 'package:tourstats/leagues/domain/repository/remote_leagues_repository.dart';
import 'package:tourstats/teams/domain/model/league.dart';

class StratzLeaguesRepository extends RemoteLeaguesRepository{
  StratzDatasource datasource;
  StratzLeaguesRepository({required this.datasource});

  @override
  Future<Result<List<League>>> fetchLeagues(String? startEpochs, String? endEpochs) async {
    Result<List<LeagueDto>> response = await datasource.fetchLeagues(startEpochs, endEpochs);
    switch (response) {
      case Ok<List<LeagueDto>>():
        return Result.onSuccess(
          response.value
            .map<League>(
              (dto)=> dto.toModel()
            ).toList()
          );
      case Error<List<LeagueDto>>():
        return Result.onError(response.error);
    }
  }

}