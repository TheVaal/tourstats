import 'package:equatable/equatable.dart';

class League extends Equatable{
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
  
  const League({
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

  @override
  List<Object?> get props => [id, name, displayName, tier, startDateTime, endDateTime, description, venue,country, prizePool,];
}