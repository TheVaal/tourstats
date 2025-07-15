
import 'package:tourstats/core/domain/utils/result.dart';
import 'package:tourstats/teams/domain/model/league.dart';

abstract class GetLeaguesUseCase{
  Stream<Result<List<League>>> fetchLeagues(String? startEpochs, String? endEpochs);
}