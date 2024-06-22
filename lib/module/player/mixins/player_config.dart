import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';

mixin PlayerConfig {
  final _Player _player = _Player();
  Duration? duation;
  bool? isPlaying;
  bool isRepeat = false;
  bool isShuffle = false;

  void repeatSong() async {
    if (isRepeat) {
      await _player.audioPlayer.setLoopMode(LoopMode.one);
    } else {
      await _player.audioPlayer.setLoopMode(LoopMode.off);
    }
    isRepeat = !isRepeat;
  }

  void shuffleSong() async {
    if (isShuffle) {
      await _player.audioPlayer.setShuffleModeEnabled(true);
    } else {
      await _player.audioPlayer.setShuffleModeEnabled(false);
    }
    isShuffle = !isShuffle;
  }

  void changePosition(double value) {
    final songDuration = duation;
    if (songDuration == null) {
      return;
    }
    final position = value * songDuration.inMilliseconds;
    _player.audioPlayer.seek(Duration(milliseconds: position.round()));
  }

  Stream<Duration> currentPosition() {
    return _player.audioPlayer.createPositionStream();
  }

  Stream<Duration?> getDuration() {
    return _player.audioPlayer.durationStream.asBroadcastStream();
  }

  void setDuration() {
    getDuration().first.then((value) => duation = value);
  }

  void togglePlay(String url) {
    if (_player.isInitialized() && !_player.isPlaying()) {
      _playSong(url);
    } else if (!_player.isPlaying() && !_player.isInitialized()) {
      _player.audioPlayer.play();
    } else {
      _player.audioPlayer.pause();
    }
    isPlaying = _player.isPlaying();
  }

  void _playSong(String songUrl) async {
    LockCachingAudioSource src = LockCachingAudioSource(Uri.parse(songUrl));
    Duration? duration = await _player.audioPlayer.setAudioSource(src);
    if (duration != null) {
      setDuration();
      await _player.audioPlayer.play();
      // isPlaying = false;
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
