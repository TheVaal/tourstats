import 'package:flutter/material.dart';
import 'package:tourstats/app/navigation/nav_constants.dart';
import 'package:tourstats/app/navigation/nav_notifier.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({super.key});

  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBar(
          destinations: NavConstants.values.map(
            (destination) => 
              NavigationDestination(icon: Icon(destination.icon), label: destination.screenTitle)
          ).toList(),
          selectedIndex: selectedPage.index,
          onDestinationSelected: (pageIndex) {
            selectedPageNotifier.value = NavConstants.values[pageIndex];
          },
        );
      }
    );
  }
}