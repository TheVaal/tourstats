import 'package:flutter/material.dart';
import 'package:tourstats/app/presentation/app.dart';
import 'package:tourstats/di/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(TouranamentStatsApp());
}

