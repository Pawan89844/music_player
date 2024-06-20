import 'package:flutter/material.dart';

class PlayingPositionBar extends StatelessWidget {
  const PlayingPositionBar({super.key});

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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('1:46'),
              Text('3:40'),
            ],
          ),
        ),
      ],
    );
  }
}
