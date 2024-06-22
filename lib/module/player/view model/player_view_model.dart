import 'package:flutter/material.dart';
import 'package:music_player/module/player/mixins/player_config.dart';

class PlayerViewModel extends ChangeNotifier with PlayerConfig {
  int currentPlaying = 0;

  // @override
  // void playSong(String songUrl) {
  //   super.playSong(songUrl);
  //   notifyListeners();
  // }

  @override
  void togglePlay(String url) {
    super.togglePlay(url);
    notifyListeners();
  }

  @override
  void repeatSong() {
    super.repeatSong();
    notifyListeners();
  }

  @override
  void shuffleSong() {
    super.shuffleSong();
    notifyListeners();
  }

  @override
  void setDuration() {
    super.setDuration();
    notifyListeners();
  }

  @override
  void changePosition(double value) {
    super.changePosition(value);
    notifyListeners();
  }

  // @override
  // double convertDuration(Duration duration) {
  //   notifyListeners();
  //   return super.convertDuration(duration);
  // }
}
