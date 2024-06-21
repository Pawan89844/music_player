import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_cache/just_audio_cache.dart';

mixin PlayerConfig {
  final _Player _player = _Player();
  ValueNotifier<String> songDuration = ValueNotifier<String>('');
  bool? isPlaying;
  bool isRepeat = false;
  bool isShuffle = false;

  void repeatSong() {
    isRepeat = !isRepeat;
  }

  void shuffleSong() {
    isShuffle = !isShuffle;
  }

  Stream<Duration> currentPosition() {
    return _player.audioPlayer.createPositionStream();
  }

  double convertDuration(Duration duration) {
    String durationStr = duration.abs().toString();
    String extratedDuration = durationStr.substring(2, 7);
    String newDuration = extratedDuration.replaceFirst(':', '.');
    double parsedDuration = double.parse(newDuration);
    return parsedDuration;
  }

  void togglePlay(String url) {
    if (_player.isInitialized()) {
      _playSong(url);
    } else if (!_player.isPlaying() && !_player.isInitialized()) {
      _player.audioPlayer.play();
    } else {
      _player.audioPlayer.pause();
    }
    isPlaying = _player.isPlaying();
  }

  void _playSong(String songUrl) async {
    // Duration? duration = await _player.audioPlayer.setUrl(songUrl);
    LockCachingAudioSource src = LockCachingAudioSource(Uri.parse(songUrl));
    Duration? duration = await _player.audioPlayer.setAudioSource(src);
    if (duration != null) {
      await _player.audioPlayer.play();
      isPlaying = false;
      String inMinutes = duration.abs().toString();
      songDuration.value = inMinutes.substring(2, 7);
    }
  }

  IconData selectedIcon(bool? isPlaying) {
    if (isPlaying == null || isPlaying) {
      return CupertinoIcons.play;
    } else {
      return CupertinoIcons.pause;
    }
  }
}

class _Player {
  AudioPlayer audioPlayer = AudioPlayer();
  // String songDuration = '';

  bool isInitialized() {
    return audioPlayer.duration == null;
  }

  bool isPlaying() {
    return audioPlayer.playerState.playing;
  }
}
