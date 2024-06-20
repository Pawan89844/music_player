import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/data/songs/app_songs.dart';
import 'package:music_player/module/player/components/playing_app_bar.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<PlayerViewModel>(
        builder: (context, value, child) {
          if (value.songDuration == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                const PlayingAppBar(),
                PlayingThumbnail(thumbnailUrl: _songs.songs[0].songThumbnail),
                PlayingSongInfo(
                    title: _songs.songs[0].title,
                    singer: _songs.songs[0].singer),
                const Spacer(),
                const PlayingPositionBar(),
                PlayingControls(
                    play: () => value.togglePlay(_songs.songs[0].songUrl)),
                const SizedBox(height: 20.0),
              ],
            );
          }
        },
      ),
    );
  }
}
