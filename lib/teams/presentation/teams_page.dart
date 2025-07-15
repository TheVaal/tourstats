import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourstats/di/injection_container.dart';
import 'package:tourstats/teams/presentation/bloc/teams_bloc.dart';
import 'package:tourstats/teams/presentation/components/teams_screen.dart';

class TeamsPage extends StatelessWidget {
  const TeamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        lazy: false,
        create: (_) => locator<TeamsBloc>()..add(FetchTeamsData()),
        child: const TeamsScreen(),
      );
  }
}