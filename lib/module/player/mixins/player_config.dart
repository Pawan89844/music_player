import 'package:just_audio/just_audio.dart';

mixin PlayerConfig {
  final _Player _player = _Player();

  void playSong(String url) {
    _player.playSong(url);
  }

  void play() async {
    await _player.audioPlayer.play();
  }

  void pauseSong() async {
    await _player.audioPlayer.pause();
  }

  bool isPlaying() {
    return _player.audioPlayer.playerState.playing;
  }

  bool isInitialized() {
    return _player.audioPlayer.duration == null;
  }

  String? duration() {
    String? duration = _player._songDuration?.abs().toString();
    return duration;
  }
}

class _Player {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration? _songDuration;

  Duration? get duration => _songDuration;

  Duration? _setDuration(Duration? sDuration) {
    _songDuration = sDuration;
    return _songDuration;
  }

  Future<Duration?> _initPlayer(String url) async {
    Duration? duration = await audioPlayer.setUrl(url);
    return _setDuration(duration);
  }

  void playSong(String songUrl) async {
    Duration? duration = await _initPlayer(songUrl);
    if (duration != null) {
      await audioPlayer.play();
    }
  }
}
