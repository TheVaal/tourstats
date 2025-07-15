import 'package:tourstats/teams/domain/model/team.dart';

class TeamDto {
  final String name;
  final String id;
  final String logo;
  final String tag;
  final String winCount;
  final String lossCount;
  
  TeamDto({
    required this.name,
    required this.id,
    required this.logo,
    required this.tag,
    required this.winCount,
    required this.lossCount,
  });

  factory TeamDto.fromJson(Map<String, dynamic> json) {
    return TeamDto(
      name: json['name'] ?? '',
      id: json['id']?.toString() ?? '',
      logo: json['logo'] ?? '',
      tag: json['tag'] ?? '',
      winCount: json['winCount']?.toString() ?? '0',
      lossCount: json['lossCount']?.toString() ?? '0',
    );
  }

  Team toModel() {
    return Team(
      name: name,
      id: id,
      logo: logo,
      tag: tag,
      winCount: int.tryParse(winCount) ?? 0,
      lossCount: int.tryParse(lossCount) ?? 0,
    );
  }
}