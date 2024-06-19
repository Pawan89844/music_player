import 'package:flutter/material.dart';
import 'package:music_player/constants/app_strings.dart';
import 'package:music_player/module/home/home.dart';
import 'package:music_player/providers/app_providers.dart';
import 'package:music_player/style/theme/app_theme.dart';
import 'package:provider/provider.dart';

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProvider.provider,
      child: MaterialApp(
        title: AppString.appName,
        theme: AppTheme().activeTheme(),
        home: const Home(),
      ),
    );
  }
}
