import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/module/player/view%20model/player_view_model.dart';
import 'package:provider/provider.dart';

class PlayingControls extends StatelessWidget {
  final void Function()? play;
  const PlayingControls({super.key, required this.play});

  @override
  Widget build(BuildContext context) {
    var value = Provider.of<PlayerViewModel>(context);
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {}, icon: const Icon(CupertinoIcons.shuffle)),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.backward_fill,
              )),
          InkWell(
            onTap: play,
            borderRadius: BorderRadius.circular(20.0),
            child: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.black,
              child: Icon(
                value.selectedIcon(value.isPlaying),
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(CupertinoIcons.forward_fill)),
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.repeat)),
        ],
      ),
    );
  }
}
