import 'package:flutter/material.dart';
import 'package:music_player/data/songs/app_songs.dart';
import 'package:music_player/module/player/components/playing_controls.dart';
import 'package:music_player/module/player/components/playing_position_bar.dart';
import 'package:music_player/module/player/components/playing_song_info.dart';
import 'package:music_player/module/player/components/playing_thumbnail.dart';
import 'package:music_player/module/player/view%20model/player_view_model.dart';
import 'package:provider/provider.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final AppSongs _songs = AppSongs();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<PlayerViewModel>(
            builder: (context, value, __) {
              return Column(
                children: [
                  PlayingThumbnail(
                      thumbnailUrl:
                          _songs.songs[value.currentPlaying].songThumbnail),
                  const Spacer(),
                  PlayingSongInfo(
                      title: _songs.songs[value.currentPlaying].title,
                      singer: _songs.songs[value.currentPlaying].singer),
                  const PlayingPositionBar(),
                  PlayingControls(
                      play: () => value.togglePlay(_songs.songs[0].songUrl)),
                  const SizedBox(height: 20.0),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
