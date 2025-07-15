  
import 'package:tourstats/teams/domain/model/league.dart';

class LeagueDto {
  final String id;
  final String name;
  final String displayName;
  final String tier;
  final int startDateTime;
  final int endDateTime;
  final String description;
  final String venue;
  final String country;
  final String prizePool;
  
  LeagueDto({
    required this.id,
    required this.name,
    required this.displayName,
    required this.tier,
    required this.startDateTime,
    required this.endDateTime,
    required this.description,
    required this.venue,
    required this.country,
    required this.prizePool,
  });

  factory LeagueDto.fromJson(Map<String, dynamic> json) {
    return LeagueDto(
      name: json['name'] ?? '',
      id: json['id']?.toString() ?? '',
      displayName: json['displayName'] ?? '',
      tier: json['tier'] ?? '',
      startDateTime: json['startDateTime'] ?? 0,
      endDateTime: json['endDateTime'] ?? 0,
      description: json['description'] ?? '',
      venue: json['venue'] ?? '',
      country: json['country'] ?? '',
      prizePool: json['prizePool']?.toString() ?? '',
    );
  }

  League toModel() {
    return League(
      id: id,
      name: name,
      displayName: displayName,
      tier: tier,
      startDateTime: startDateTime,
      endDateTime : endDateTime,
      description: description,
      venue: venue,
      country: country,
      prizePool: prizePool
    );
  }
}