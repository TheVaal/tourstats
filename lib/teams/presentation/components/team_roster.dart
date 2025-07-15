import 'package:flutter/material.dart';
import 'package:tourstats/teams/domain/model/team_player.dart';

class TeamRosterWidget extends StatelessWidget {
  final bool isOpen;
  final List<TeamPlayer> roster;
  const TeamRosterWidget({
    super.key,
    required this.isOpen,
    required this.roster
  });

  @override
  Widget build(BuildContext context) {
  
    return Column(
      children: roster.map<Widget>(
        (item) { 
          return Text(item.name);
        }
      ).toList(),
    );
  }
}