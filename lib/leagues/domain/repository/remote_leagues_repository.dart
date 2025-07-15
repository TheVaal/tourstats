import 'package:tourstats/core/domain/utils/result.dart';
import 'package:tourstats/teams/domain/model/league.dart';

abstract class RemoteLeaguesRepository {
  Future<Result<List<League>>> fetchLeagues(String? startEpochs, String? endEpochs);
}