import 'package:graphql/client.dart';
import 'package:tourstats/core/data/dto/league_dto.dart';
import 'package:tourstats/core/data/dto/team_dto.dart';
import 'package:tourstats/core/domain/exceptions/api_exception.dart';
import 'package:tourstats/core/domain/exceptions/unknown_exception.dart';
import 'package:tourstats/core/domain/utils/result.dart';

abstract class StratzDatasource {
  Future<Result<List<TeamDto>>> fetchTeams();
  Future<Result<List<LeagueDto>>> fetchLeagues(String? startEpochs, String? endEpochs);
}
class StratzDatasourceImpl extends StratzDatasource {
  
final GraphQLClient client;

  StratzDatasourceImpl({required this.client});
  
  @override
  Future<Result<List<TeamDto>>> fetchTeams() async {
    
    final result = await client.query(QueryOptions(
      document: gql("""
        query {
          stratz {
            search(
              request: {
                query: ""
                searchType: TEAMS
                teamIsPro: true
                take: 10000
              }
            ) {
              teams {
                id
                name
                logo
                tag
                winCount
                lossCount
              }
            }
          }
        }
      """),
    ));
    
    if (result.data != null) {
      try {
        var list = result.data?['stratz']['search']['teams']
          .map<TeamDto>((json) => TeamDto.fromJson(json as Map<String, dynamic>))
          .toList();
      
      return Result.onSuccess(list);
      } catch (e){
        return Result.onError(ApiException(e.toString()));
      }
      
    } else if (result.hasException){
      
      return Result.onError(ApiException(result.exception.toString()));
    } else {
      
      return Result.onError(UnknownApiException());
    }
  }
  
  @override
  Future<Result<List<LeagueDto>>> fetchLeagues(
    String? startEpochs,
    String? endEpochs
  ) async{
    final result = await client.query(QueryOptions(
      document: gql("""
        {
          leagues(
            request: {
              ${startEpochs == null? "" : "betweenStartDateTime:$startEpochs"}
              ${endEpochs == null? "" : "betweenEndDateTime:$endEpochs"}
              tiers:[PROFESSIONAL, INTERNATIONAL]
              take: 1000000
            })
        {
          id
          name
          displayName
          banner
          imageUri
          tier
          startDateTime
          endDateTime
          description
          venue
          country
          prizePool
        }
      }
      """),
    ));
    
    if (result.data != null) {
      try {
        
        var list = result.data?['leagues']
          .map<LeagueDto>((json) => LeagueDto.fromJson(json as Map<String, dynamic>))
          .toList();

        return Result.onSuccess(list);
      } catch (e){
        return Result.onError(ApiException(e.toString()));
      }
      
    } else if (result.hasException){
      
      return Result.onError(ApiException(result.exception.toString()));
    } else {
      
      return Result.onError(UnknownApiException());
    }
  }
}