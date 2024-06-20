import 'package:flutter/material.dart';

class PlayingPositionBar extends StatelessWidget {
  final String duration, currentPosition;
  const PlayingPositionBar(
      {super.key, required this.duration, required this.currentPosition});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: 0.2,
          onChanged: (double value) {},
          activeColor: Colors.black,
          thumbColor: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(currentPosition),
              Text(duration),
            ],
          ),
        ),
      ],
    );
  }
}
