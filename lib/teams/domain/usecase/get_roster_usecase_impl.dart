
import 'package:tourstats/core/domain/usecase/get_roster_usecase.dart';
import 'package:tourstats/core/domain/utils/result.dart';
import 'package:tourstats/teams/domain/model/team_player.dart';
import 'package:tourstats/teams/domain/repository/remote_roster_repository.dart';

class GetRosterUseCaseImpl extends GetRosterUseCase{
  RemoteRosterRepository repository;
  GetRosterUseCaseImpl({required this.repository});

  @override
  Stream<Result<List<TeamPlayer>>> fetchRoster(String teamId) async* {
    
    yield await repository.fetchPlayers(teamId);
  }
  
}