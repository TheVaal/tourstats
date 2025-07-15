import 'package:tourstats/teams/domain/model/team_player.dart';

class TeamPlayerDto {
  final String name;
  final String id;
  final String teamId;
  final bool isCurrentMember;

  TeamPlayerDto({
    required this.name,
    required this.id,
    required this.teamId,
    required this.isCurrentMember 
  });

    factory TeamPlayerDto.fromJson(String teamId, Map<String, dynamic> json) {
    return TeamPlayerDto(
      name: json['name'] ?? '',
      id: json['account_id']?.toString() ?? '',
      isCurrentMember: json['is_current_team_member'] ?? false,
      teamId: teamId
    );
  }

  TeamPlayer toModel() {
    return TeamPlayer(
      name: name,
      id: id,
      teamId: teamId
    );
  }
}