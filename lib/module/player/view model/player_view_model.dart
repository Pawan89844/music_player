import 'package:flutter/material.dart';
import 'package:music_player/module/player/mixins/player_config.dart';

class PlayerViewModel extends ChangeNotifier with PlayerConfig {
  // void setDuration() async {
  //   songDuration = await super.duration();
  //   print('Build: $songDuration');
  //   notifyListeners();
  // }

  @override
  void playSong(String songUrl) {
    super.playSong(songUrl);
    notifyListeners();
  }

  @override
  void togglePlay(String url) {
    super.togglePlay(url);
    notifyListeners();
  }
}
