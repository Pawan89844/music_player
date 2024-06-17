import 'package:flutter/material.dart';
import 'package:music_player/constants/app_strings.dart';
import 'package:music_player/module/home/home.dart';
import 'package:music_player/style/theme/app_theme.dart';

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      theme: AppTheme().activeTheme(),
      home: const Home(),
    );
  }
}
