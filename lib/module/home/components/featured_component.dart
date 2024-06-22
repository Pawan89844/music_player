import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../data/songs/app_songs.dart';

class FeaturedComponent extends StatelessWidget {
  FeaturedComponent({super.key});
  final AppSongs _songs = AppSongs();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.symmetric(horizontal: 12.0),
          child: const Text(
            'Featured Playlist',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        const SizedBox(height: 14.0),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 16 / 13,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 0.0),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    final songs = _songs.songs[index];
                    return Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(songs.songThumbnail),
                          ),
                          shape: BoxShape.circle),
                    );
                  },
                ),
              ),
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.only(right: 14.0),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  border:
                      Border.fromBorderSide(BorderSide(color: Colors.black12))),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 8.0),
                      child: const Text('City Pop')),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 8.0),
                      child: const Text('266 songs')),
                  const SizedBox(height: 8.0),
                  SizedBox(
                    height: 110.0,
                    width: double.infinity,
                    child: Card(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          _songs.songs[2].songThumbnail,
                          fit: BoxFit.fitWidth,
                          // cacheHeight: 60,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ],
    );
  }
}
