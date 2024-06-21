import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';

mixin PlayerConfig {
  final _Player _player = _Player();
  String songDuration = '';
  bool isPlaying = false;
  bool isRepeat = false;
  bool isShuffle = false;

  void repeatSong() {
    isRepeat = !isRepeat;
  }

  void shuffleSong() {
    isShuffle = !isShuffle;
  }

  Stream<Duration?> currentPosition() {
    return _player.audioPlayer.positionStream;
  }

  double convertDuration(Duration duration) {
    String durationStr = duration.abs().toString();
    String extratedDuration = durationStr.substring(2, 7);
    String newDuration = extratedDuration.replaceFirst(':', '.');
    double parsedDuration = double.parse(newDuration);
    return parsedDuration;
  }

  void togglePlay(String url) {
    _player.togglePlay(url);
    isPlaying = _player.isPlaying();
  }

  void playSong(String songUrl) async {
    _player.playSong(songUrl);
    if (!_player.isPlaying()) {
      await _player.audioPlayer.play();
      songDuration = _player.songDuration;
      isPlaying = _player.isPlaying();
    }
  }

  IconData selectedIcon(bool isPlaying) {
    if (!isPlaying) {
      return CupertinoIcons.pause;
    } else {
      return CupertinoIcons.play;
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
