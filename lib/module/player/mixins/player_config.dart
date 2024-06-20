import 'package:just_audio/just_audio.dart';

mixin PlayerConfig {
  final _Player _player = _Player();

  _Player get player => _player;

  void playSong(String url) {
    _player.playSong(url);
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
    var duration = await audioPlayer.setUrl(url);
    return _setDuration(duration);
  }

  void playSong(String songUrl) async {
    Duration? duration = await _initPlayer(songUrl);
    if (duration != null) {
      await audioPlayer.play();
    }
  }
}
