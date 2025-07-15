import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourstats/teams/presentation/bloc/teams_bloc.dart';
import 'package:tourstats/teams/presentation/components/team_data.dart';
import 'package:tourstats/teams/presentation/components/team_logo.dart';

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({super.key});

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Center(
        child: BlocBuilder<TeamsBloc, TeamsState>(
        builder: (context, state) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) { 
              if (state.list.isEmpty) {
                return null;
              }
              else {
                return GestureDetector(
                  onTap: () {
                    context.read<TeamsBloc>().add(FetchRosterData(state.list[index].id));
                  },
                  child:Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      spacing: 10,
                      children: [
                        TeamLogoWidget(
                          logoUrl: state.list[index].logo
                        ),
                        TeamDataWidget(
                          team: state.list[index]
                        )
                      ],//
                    ),
                  )
                );
              }
            },
          );
        },
      ),
    );
  }
}