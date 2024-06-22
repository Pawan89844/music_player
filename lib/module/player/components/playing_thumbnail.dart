import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayingThumbnail extends StatelessWidget {
  final String thumbnailUrl;
  const PlayingThumbnail({super.key, required this.thumbnailUrl});

  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context).size;
    return Container(
      height: query.height * .4,
      width: double.infinity,
      margin: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(thumbnailUrl),
            fit: BoxFit.contain,
            isAntiAlias: true,
            filterQuality: FilterQuality.high),
        shape: BoxShape.circle,
      ),
    );
  }
}
