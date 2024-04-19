class SongsModel {
  final int id;
  final String title;
  final String singer;
  final String songThumbnail;
  final String songUrl;
  bool isFavourite;

  SongsModel(
      {required this.id,
      required this.title,
      required this.singer,
      required this.songThumbnail,
      required this.songUrl,
      required this.isFavourite});
}
