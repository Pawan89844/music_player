import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlayingControls extends StatelessWidget {
  final void Function()? play;
  const PlayingControls({super.key, required this.play});

  @override
  Widget build(BuildContext context) {
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
          CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.black,
            child: InkWell(
              onTap: play,
              child: const Icon(
                CupertinoIcons.pause,
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
