import 'package:flutter/material.dart';

enum NavConstants {
  home('Home', Icons.home),
  teams('Teams', Icons.group);

  final String screenTitle;
  final IconData icon;
  const NavConstants(this.screenTitle, this.icon);

}