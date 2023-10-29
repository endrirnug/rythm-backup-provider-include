import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import '../providers/playlistProvider.dart';
import 'package:rythm/providers/songProvider.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';

class UsersProvider extends ChangeNotifier {
  String id;
  String email;
  String username;
  List<PlayListProvider> playListArr = [];

  UsersProvider({
    this.id = "",
    this.email = "",
    this.username = "",
  });

  void tambahPlaylistBaru({
    required String namePlaylist,
    required String descPlaylist,
    required File? selectedImage,
    required String? selectedImageFileName,
  }) async {
    if (namePlaylist.isNotEmpty &&
        selectedImage != null &&
        selectedImageFileName != null) {
      // Mendapatkan direktori dokumen aplikasi
      final appDocDir = await getApplicationDocumentsDirectory();
      final imageFileName =
          selectedImageFileName; // Menggunakan nama file yang terpilih
      final localImage = File("${appDocDir.path}/$imageFileName");

      // Mengecek apakah file lokal ada
      if (await localImage.exists()) {
        // File lokal ada, Anda bisa menggunakan localImage untuk mengaksesnya
        // Tambahkan playlist baru dengan path gambar lokal
        playListArr.add(PlayListProvider(
          id: "04", // Sesuaikan dengan kebutuhan
          name: namePlaylist, // Menggunakan value dari namePlaylist
          image: localImage.path,
          desc: descPlaylist, // Menggunakan value dari descPlaylist
        ));
        notifyListeners();
        // Bersihkan input setelah menambah playlist baru
        // Lakukan tindakan lain setelah berhasil menambahkan playlist
      } else {
        // File lokal tidak ditemukan, Anda perlu menanganinya sesuai kebutuhan Anda
        print('File lokal tidak ditemukan.');
      }
    }
  }

  void deletePlaylist({required PlayListProvider playlist}) async {
    playListArr.remove(playlist);
    notifyListeners();
  }

  List<PlayListProvider> filteredPlaylists = [];

  void searchPlaylist({
    required String searchString,
  }) {
    // Create a copy of the original playListArr
    filteredPlaylists = List.from(playListArr);

    // Filter the copy of the list
    filteredPlaylists.removeWhere((playlist) {
      return !playlist.name.toLowerCase().contains(searchString.toLowerCase());
    });
  }

  void tambahLagukePlaylist(
      {required PlayListProvider playlist, required SongProvider song}) {
    playlist.songList.add(song);
    notifyListeners();
  }
}
