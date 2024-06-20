import 'package:flutter/material.dart';
import 'package:music_player/module/player/mixins/player_config.dart';

class PlayerViewModel extends ChangeNotifier with PlayerConfig {
  String? songDuration = '';

  @override
  void playSong(String url) {
    super.playSong(url);
    notifyListeners();
  }

  @override
  String? duration() {
    songDuration = super.duration();
    notifyListeners();
    return songDuration;
  }
}
