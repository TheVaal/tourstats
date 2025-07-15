import 'dart:convert';
import 'package:tourstats/core/data/dto/teamplayer_dto.dart';
import 'package:tourstats/core/domain/exceptions/api_exception.dart';
import 'package:tourstats/core/domain/exceptions/unknown_exception.dart';
import 'package:tourstats/core/domain/utils/result.dart';
import 'package:http/http.dart' as http;

abstract class OpendotaDataSource {
  Future<Result<List<TeamPlayerDto>>> fetchPlayers(String teamid);
}

class OpendotaDataSourceImpl extends OpendotaDataSource {
  @override
  Future<Result<List<TeamPlayerDto>>> fetchPlayers(String teamId) async {
    try {
    
      final result = await http.get(
        Uri.parse("https://api.opendota.com/api/teams/$teamId/players")
      );
     
      switch (result.statusCode) {
        case >= 200 && <= 299:
          
          var responseData = json.decode(result.body);
          
          List<TeamPlayerDto> list = responseData.map<TeamPlayerDto>(
            (json)=> TeamPlayerDto.fromJson(teamId, json)
          ).toList();
          
          list.removeWhere((item)=>!item.isCurrentMember);
        
          return Result.onSuccess(list);
        case >= 300 && <= 399:
          return Result.onError(ApiException("Api call was redirected"));

        case >= 400 && <= 499:
          return Result.onError(ApiException("Client error"));
        case >= 500 && <= 599:
          return Result.onError(ApiException("Server error"));
        default:
          return Result.onError(UnknownApiException());
      }
      
    } catch(e){
      return Result.onError(ApiException(e.toString()));
    }
    
  }

}