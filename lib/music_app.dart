import 'package:flutter/material.dart';
import 'package:music_player/module/home/home.dart';

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF1F2F7),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
