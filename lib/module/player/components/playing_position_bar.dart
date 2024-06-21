import 'package:flutter/material.dart';
import 'package:music_player/module/player/view%20model/player_view_model.dart';
import 'package:provider/provider.dart';

class PlayingPositionBar extends StatelessWidget {
  // final String duration, currentPosition;
  const PlayingPositionBar({super.key});

  @override
  Widget build(BuildContext context) {
    var value = Provider.of<PlayerViewModel>(context);
    return StreamBuilder<Duration>(
        stream: value.currentPosition(),
        builder: (context, snapshot) {
          double newPosition = value.convertDuration(
              snapshot.data ?? const Duration(minutes: 0, seconds: 2));

          return Column(
            children: [
              Slider(
                max: 2.58,
                value: newPosition,
                onChanged: (double value) {},
                activeColor: Colors.black,
                thumbColor: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(newPosition.toString()),
                    ValueListenableBuilder(
                      valueListenable: value.songDuration,
                      builder: (context, vl, child) {
                        return Text(vl.isNotEmpty ? vl : '0:00');
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        });
    // return StreamBuilder<Duration?>(
    //     stream: value.currentPosition().first.asStream(),
    //     builder: (context, snapshot) {
    //       double parsedDuration = value.convertDuration(
    //           snapshot.data ?? const Duration(minutes: 0, seconds: 0));
    //       print('Duration: $parsedDuration');
    //       return Column(
    //         children: [
    //           Slider(
    //             max: doubleDuration ??= 0.2,
    //             value: parsedDuration,
    //             onChanged: (double value) {
    //               print('Value: $value');
    //             },
    //             activeColor: Colors.black,
    //             thumbColor: Colors.white,
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 24.0),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Text(currentPosition),
    //                 Text(duration.isEmpty ? '0:00' : duration),
    //               ],
    //             ),
    //           ),
    //         ],
    //       );
    //     });
  }
}
