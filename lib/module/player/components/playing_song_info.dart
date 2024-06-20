import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class PlayingSongInfo extends StatelessWidget {
  final String title, singer;
  const PlayingSongInfo({super.key, required this.title, required this.singer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          margin: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Text(
            singer,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0),
          ),
        ),
      ],
    );
  }
}
