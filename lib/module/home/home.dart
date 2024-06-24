import 'package:flutter/material.dart';
import 'package:music_player/constants/app_strings.dart';
import 'package:music_player/data/songs/app_songs.dart';
import 'package:music_player/module/home/components/featured_component.dart';
import 'package:music_player/module/home/components/for_you_component.dart';
import 'package:music_player/module/home/components/stories_component.dart';
import 'package:music_player/module/player/player_screen.dart';
import 'package:music_player/module/player/view%20model/player_view_model.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AppSongs _songs = AppSongs();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PlayerViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(AppString.homeScreen),
        forceMaterialTransparency: true,
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20.0),
      ),
      bottomNavigationBar: ListTile(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PlayerScreen(),
            )),
        leading:
            Image.network(_songs.songs[provider.currentPlaying].songThumbnail),
        title: Text(_songs.songs[provider.currentPlaying].title),
        subtitle: Text(_songs.songs[provider.currentPlaying].singer),
        trailing: IconButton(
            onPressed: () => provider.togglePlay(_songs.songs[0].songUrl),
            icon: Icon(provider.selectedIcon(provider.isPlaying))),
      ),
      body: ListView(
        children: [
          // Story Section
          Container(
            height: 100.0,
            alignment: Alignment.centerLeft,
            width: double.infinity,
            child: const StoriesComponent(),
          ),
          const SizedBox(height: 20.0),
          // Featured Playlist
          Container(
            height: 230.0,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            // color: Colors.green,
            child: FeaturedComponent(),
          ),
          const SizedBox(height: 20.0),
          // Perfect for you
          Container(
            height: 250.0,
            // color: Colors.blue,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 8.0),
            width: double.infinity,
            child: ForYouComponent(),
          )
        ],
      ),
    );
  }
}
