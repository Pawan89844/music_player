import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/data/songs/app_songs.dart';

class PlayerScreen extends StatelessWidget {
  PlayerScreen({super.key});
  final AppSongs _songs = AppSongs();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.chevron_down)),
              const Text('Now Playing',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
              IconButton(
                  onPressed: () {}, icon: const Icon(CupertinoIcons.share))
            ],
          ),
          Container(
            height: 200.0,
            width: double.infinity,
            margin: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(_songs.songs[0].songThumbnail))),
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                margin: const EdgeInsets.all(8.0),
                child: Text(
                  _songs.songs[0].title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Text(
                  _songs.songs[0].singer,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14.0),
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
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
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(CupertinoIcons.shuffle)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.backward_fill,
                    )),
                const CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.black,
                  child: Icon(
                    CupertinoIcons.pause,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.forward_fill)),
                IconButton(
                    onPressed: () {}, icon: const Icon(CupertinoIcons.repeat)),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
