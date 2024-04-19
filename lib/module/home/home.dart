import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/data/songs/app_songs.dart';
import 'package:music_player/module/player/player_screen.dart';
import 'package:music_player/style/border/app_border.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AppSongs _songs = AppSongs();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Good Morning'),
        forceMaterialTransparency: true,
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20.0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _songs.songs.length,
              itemBuilder: (context, index) {
                final songs = _songs.songs[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: AppBorders.kListTileBorder,
                          right: AppBorders.kListTileBorder,
                          left: AppBorders.kListTileBorder)),
                  child: ListTile(
                    title: Text(songs.title),
                    subtitle: Text(songs.singer),
                    leading: Container(
                      width: 50.0,
                      margin: const EdgeInsets.only(right: 8.0),
                      alignment: Alignment.center,
                      child: Image.network(songs.songThumbnail),
                    ),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border)),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
                child: Card(
                  color: Colors.white,
                  child: ListTile(
                    onTap: () => showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      useSafeArea: true,
                      builder: (context) => PlayerScreen(),
                    ),
                    leading: Image.network(_songs.songs[0].songThumbnail),
                    title: Text(_songs.songs[0].title),
                    subtitle: Text(_songs.songs[0].singer),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.pause)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
