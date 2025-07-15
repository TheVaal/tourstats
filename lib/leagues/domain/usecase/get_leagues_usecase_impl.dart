import 'package:tourstats/core/domain/usecase/get_leagues_usecase.dart';
import 'package:tourstats/core/domain/utils/result.dart';
import 'package:tourstats/leagues/domain/repository/remote_leagues_repository.dart';
import 'package:tourstats/teams/domain/model/league.dart';

class GetLeaguesUseCaseImpl extends GetLeaguesUseCase {
  RemoteLeaguesRepository repository;
  GetLeaguesUseCaseImpl({required this.repository});
  
  @override
  Stream<Result<List<League>>> fetchLeagues(String? startEpochs, String? endEpochs) async* {
    yield await repository.fetchLeagues(startEpochs, endEpochs);
  }
}