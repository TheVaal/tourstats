import 'package:equatable/equatable.dart';
import 'package:tourstats/teams/domain/model/team_player.dart';

class TeamUi extends Equatable{
  final String name;
  final String id;
  final String logo;
  final String tag;
  final int winCount;
  final int lossCount;
  final bool isOpen;
  final List<TeamPlayer> roster;

  const TeamUi({
    this.name = '', 
    this.id= '',
    this.logo= '',
    this.tag= '',
    this.winCount = 0,
    this.lossCount = 0, 
    this.isOpen = false,
    this.roster = const []
  });

  TeamUi copyWith({
    String? name, 
    String? id, 
    String? logo, 
    String? tag, 
    int? winCount, 
    int? lossCount, 
    bool? isOpen,
    List<TeamPlayer>? roster
    }) {
    return TeamUi(
      name: name ?? this.name,
      id: id ?? this.id,
      logo: logo ?? this.logo,
      tag: tag ?? this.tag,
      winCount: winCount ?? this.winCount,
      lossCount: lossCount ?? this.lossCount,
      isOpen: isOpen ?? this.isOpen,
      roster: roster ?? this.roster
    );
  }

  @override
  List<Object?> get props => [id, name, logo, tag, winCount, lossCount, isOpen,];

}