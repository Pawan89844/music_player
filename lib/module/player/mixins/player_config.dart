import 'package:audioplayers/audioplayers.dart';

mixin PlayerConfig {
  final _Player _player = _Player();

  void playSong(String url) {
    _player.initPlayer(url);
  }
}

class _Player {
  AudioPlayer audioPlayer = AudioPlayer();

  void initPlayer(String url) async {
    UrlSource source = UrlSource(url);
    await audioPlayer.play(source);
  }
}
