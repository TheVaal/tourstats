import 'package:tourstats/core/domain/usecase/get_teams_usecase.dart';
import 'package:tourstats/core/domain/utils/result.dart';
import 'package:tourstats/teams/domain/model/team.dart';
import 'package:tourstats/teams/domain/repository/remote_teams_repository.dart';

class GetTeamsUseCaseImpl extends GetTeamsUseCase{
  RemoteTeamsRepository repository;
  GetTeamsUseCaseImpl({required this.repository});

  @override
  Stream<Result<List<Team>>> fetchTeams() async* {
    
    yield await repository.fetchTeams();
  }
  
}