import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayingAppBar extends StatelessWidget {
  const PlayingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {}, icon: const Icon(CupertinoIcons.chevron_down)),
        const Text('Now Playing',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
        IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.share))
      ],
    );
  }
}
