import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../data/songs/app_songs.dart';
import '../../player/view model/player_view_model.dart';

class ForYouComponent extends StatelessWidget {
  ForYouComponent({super.key});
  final AppSongs _songs = AppSongs();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PlayerViewModel>(context);
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.symmetric(horizontal: 12.0),
          child: const Text(
            'Perfect for you',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 200.0,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: _songs.songs.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final songs = _songs.songs[index];
              return GestureDetector(
                onTap: () {
                  provider.currentPlaying = index;
                  provider.togglePlay(songs.songUrl);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 120.0,
                      width: 140.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(songs.songThumbnail),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        songs.title.length > 20
                            ? songs.title.substring(0, 20)
                            : songs.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
