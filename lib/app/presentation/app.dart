
import 'package:flutter/material.dart';
import 'package:tourstats/app/navigation/nav_constants.dart';
import 'package:tourstats/app/navigation/nav_notifier.dart';
import 'package:tourstats/app/presentation/components/app_navbar.dart';
import 'package:tourstats/core/data/datasource/stratz_datasource.dart';
import 'package:tourstats/di/injection_container.dart';
import 'package:tourstats/leagues/presentation/home_page.dart';
import 'package:tourstats/teams/presentation/teams_page.dart';

class TouranamentStatsApp extends StatefulWidget {
  const TouranamentStatsApp({super.key});

  @override
  State<TouranamentStatsApp> createState() => _TouranamentStatsAppState();
}

class _TouranamentStatsAppState extends State<TouranamentStatsApp> {
  final datasource = locator.get<StratzDatasource>();
  @override
  Widget build(BuildContext context) {
    
    return 
      MaterialApp(
        home: ValueListenableBuilder(
          valueListenable: selectedPageNotifier, 
          builder: (context, selectedPage, child) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: Text(selectedPage.screenTitle),
              ),
              body:
                switch(selectedPage){
                  NavConstants.home => HomePage(),
                  NavConstants.teams => TeamsPage(),
                },bottomNavigationBar: AppNavBar()
            );
        } 
      ),
    );
  }
}
