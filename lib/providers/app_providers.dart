import 'package:music_player/module/player/view%20model/player_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProvider {
  static List<SingleChildWidget> provider = [
    ChangeNotifierProvider(create: (__) => PlayerViewModel()),
  ];
}
