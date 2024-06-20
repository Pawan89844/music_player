import 'package:just_audio/just_audio.dart';

mixin PlayerConfig {
  final _Player _player = _Player();
  String songDuration = '';

  void togglePlay(String url) {
    _player.togglePlay(url);
  }

  void playSong(String songUrl) async {
    _player.playSong(songUrl);
    if (!_player.isPlaying()) {
      await _player.audioPlayer.play();
      songDuration = _player.songDuration;
      print('Duration : $songDuration');
    }
  }
}

class _Player {
  AudioPlayer audioPlayer = AudioPlayer();
  String songDuration = '';

  bool isInitialized() {
    return audioPlayer.duration == null;
  }

  bool isPlaying() {
    return audioPlayer.playerState.playing;
  }

  void playSong(String songUrl) async {
    Duration? duration = await audioPlayer.setUrl(songUrl);
    if (duration != null) {
      String inMinutes = duration.abs().toString();
      songDuration = inMinutes.substring(2, 7);
      print('String: $songDuration');
      // await audioPlayer.play();
    }
  }

  void togglePlay(String url) async {
    if (isInitialized()) {
      playSong(url);
    } else if (!isPlaying() && !isInitialized()) {
      await audioPlayer.play();
    } else {
      await audioPlayer.pause();
    }
  }
}
