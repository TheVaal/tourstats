import 'package:flutter/material.dart';
import 'package:tourstats/teams/presentation/components/team_roster.dart';
import 'package:tourstats/teams/presentation/team_ui.dart';

class TeamDataWidget extends StatelessWidget {
  final TeamUi team;

  const TeamDataWidget({
    super.key,
    required this.team,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children:[
          Text("${team.tag != ""? "[${team.tag}]": ""} ${team.name}"),
          TeamRosterWidget(isOpen: team.isOpen, roster: team.roster),
        ]
      );

  }
}