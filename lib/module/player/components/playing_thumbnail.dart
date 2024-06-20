import 'package:flutter/cupertino.dart';

class PlayingThumbnail extends StatelessWidget {
  final String thumbnailUrl;
  const PlayingThumbnail({super.key, required this.thumbnailUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: double.infinity,
      margin: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(thumbnailUrl))),
    );
  }
}
