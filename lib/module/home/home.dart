import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/data/songs/app_songs.dart';

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
        child: ListView.builder(
          itemCount: _songs.songs.length,
          itemBuilder: (context, index) {
            final songs = _songs.songs[index];
            return Card(
              child: ListTile(
                title: Text(songs.title),
                subtitle: Text(songs.singer),
                leading: Container(
                  width: 80.0,
                  alignment: Alignment.center,
                  child: Image.network(songs.songThumbnail),
                ),
                trailing: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.favorite_border)),
              ),
            );
          },
        ),
      ),
    );
  }
}
