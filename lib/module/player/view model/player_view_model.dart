import 'package:flutter/material.dart';
import 'package:music_player/module/player/mixins/player_config.dart';

class PlayerViewModel extends ChangeNotifier with PlayerConfig {
  String? songDuration = '';

  void togglePlay(String url) async {
    if (isInitialized()) {
      super.playSong(url);
    } else if (!isPlaying() && !isInitialized()) {
      super.play();
    } else {
      super.pauseSong();
    }
  }

  @override
  String? duration() {
    songDuration = super.duration();
    notifyListeners();
    return songDuration;
  }
}
