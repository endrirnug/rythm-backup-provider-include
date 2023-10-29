import 'package:flutter/material.dart';

class SongProvider extends ChangeNotifier {
  String id;
  String title;
  String artist;
  String image;
  String song;

  SongProvider(
      {required this.id,
      required this.title,
      required this.artist,
      required this.image,
      required this.song});
}

List<SongProvider> songArr = [
  SongProvider(
    id: "01",
    title: "Blind Curve",
    artist: "Momoko Kikuchi",
    image: "assets/playlist1/blindCurve.jpeg",
    song: "assets/song/blindCurve.mp3",
  ),
  SongProvider(
    id: "02",
    title: "Love Was Really Gone",
    artist: "Makoto Matsushita",
    image: "assets/playlist1/loveWasReallyGone.jpg",
    song: "assets/song/loveWasReallyGone.mp3",
  ),
  SongProvider(
    id: "03",
    title: "Midnight Pretender",
    artist: "Tomoko Aran",
    image: "assets/playlist1/midnightPretender.jpg",
    song: "assets/song/midnightPretender.mp3",
  ),
  SongProvider(
    id: "04",
    title: "Plastic Love",
    artist: "Mariya Takeuchi",
    image: "assets/playlist1/plasticLove.webp",
    song: "assets/song/plasticLove.mp3",
  ),
  SongProvider(
    id: "05",
    title: "Stay With Me",
    artist: "Miki Matsubara",
    image: "assets/playlist1/stayWithMe.jpeg",
    song: "assets/song/stayWithMe.mp3",
  ),
  SongProvider(
      id: "06",
      title: "For The First Time",
      artist: "Mac DeMarco",
      image: "assets/playlist2/forthefirsttime_cover.jpg",
      song: "assets/song/FortheFirstTime.mp3"),
  SongProvider(
      id: "07",
      title: "I Want You Around",
      artist: "Snoh Aalegra",
      image: "assets/playlist2/iwantyouaround_cover.jpeg",
      song: "assets/song/Iwantyouaround.mp3"),
  SongProvider(
      id: "08",
      title: "Movie",
      artist: "Tom Misch",
      image: "assets/playlist2/movie_cover.jpg",
      song: "assets/song/Movie.mp3"),
  SongProvider(
      id: "09",
      title: "My Jinji",
      artist: "Sunset Rollercoaster",
      image: "assets/playlist2/myjinji_cover.jpeg",
      song: "assets/song/MyJinji.mp3"),
  SongProvider(
      id: "10",
      title: "My Kind of Woman",
      artist: "Mac DeMarco",
      image: "assets/playlist2/mykindofwoman_cover.jpg",
      song: "assets/song/MyKindOfWoman.mp3"),
  SongProvider(
      id: "11",
      title: "Sparkle",
      artist: "RADWIMPS",
      image: "assets/playlist3/Sparkle_cover.png",
      song: "assets/song/Sparkle.mp3"),
  SongProvider(
      id: "12",
      title: "Uchiage Hanabi",
      artist: "Daoko",
      image: "assets/playlist3/UchiageHanabi_cover.png",
      song: "assets/song/UchiageHanabi.mp3"),
  SongProvider(
      id: "13",
      title: "104Hz",
      artist: "Misekai",
      image: "assets/playlist3/104Hz_cover.png",
      song: "assets/song/104hz.mp3"),
  SongProvider(
      id: "14",
      title: "Tokyo 4AM",
      artist: "Chanmina",
      image: "assets/playlist3/Tokyo4AM_cover.png",
      song: "assets/song/tokyo4am.mp3"),
  SongProvider(
      id: "15",
      title: "Koino Uta",
      artist: "Yunomi",
      image: "assets/playlist3/KoinoUta_cover.png",
      song: "assets/song/KoinoUta.mp3")
];
