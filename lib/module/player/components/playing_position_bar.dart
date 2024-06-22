import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_player/module/player/view%20model/player_view_model.dart';
import 'package:provider/provider.dart';

class PlayingPositionBar extends StatefulWidget {
  // final String duration, currentPosition;
  const PlayingPositionBar({super.key});

  @override
  State<PlayingPositionBar> createState() => _PlayingPositionBarState();
}

class _PlayingPositionBarState extends State<PlayingPositionBar> {
  @override
  void initState() {
    super.initState();
    // var value = Provider.of<PlayerViewModel>(context, listen: false);
    // WidgetsBinding.instance.addPersistentFrameCallback((___) {
    //   value.setDuration();
    // });
  }

  @override
  Widget build(BuildContext context) {
    var value = Provider.of<PlayerViewModel>(context);
    return Column(
      children: [
        StreamBuilder<Duration>(
            stream: value.currentPosition(),
            builder: (context, snapshot) {
              return Slider(
                value: (snapshot.data != null &&
                        value.duation != null &&
                        snapshot.data!.inMilliseconds > 0 &&
                        snapshot.data!.inMilliseconds <
                            value.duation!.inMilliseconds)
                    ? snapshot.data!.inMilliseconds /
                        value.duation!.inMilliseconds
                    : 0.0,
                onChanged: value.changePosition,
                activeColor: Colors.black,
                thumbColor: Colors.white,
              );
            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StreamBuilder<Duration>(
                  stream: value.currentPosition(),
                  builder: (context, snapshot) {
                    String? newPosition =
                        snapshot.data.toString().split('.').first;
                    return Text(snapshot.data == null
                        ? '0:00'
                        : newPosition.substring(3));
                  }),
              StreamBuilder<Duration?>(
                stream: value.getDuration(),
                builder: (context, snapshot) {
                  return Text(snapshot.data == null
                      ? '0:00'
                      : snapshot.data.toString().split('.').first.substring(3));
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
