import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourstats/di/injection_container.dart';
import 'package:tourstats/leagues/presentation/components/bloc/leagues_bloc.dart';
import 'package:tourstats/leagues/presentation/components/leagues_screen.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        lazy: false,
        create: (_) => locator<LeaguesBloc>()..add(FetchLeaguesData()),
        child: const LeaguesScreen(),
      );
  }
}