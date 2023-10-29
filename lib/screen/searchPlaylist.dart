import 'package:flutter/material.dart';
import 'package:rythm/screen/playlist1.dart';
import 'package:provider/provider.dart';
import '../providers/userProvider.dart';
import '../providers/playlistProvider.dart';
import 'dart:io';

class SearchPlaylist extends StatefulWidget {
  const SearchPlaylist({Key? key}) : super(key: key);

  @override
  State<SearchPlaylist> createState() => _SearchPlaylistState();
}

class _SearchPlaylistState extends State<SearchPlaylist> {
  String searchString = "";

  @override
  void initState() {
    super.initState();

    // Panggil searchPlaylist pada initState dengan parameter searchString awal (kosong)
    context.read<UsersProvider>().searchPlaylist(searchString: "");
  }

  Widget build(BuildContext context) {
    final UsersProvider usersProvider = context.watch<UsersProvider>();
    List<PlayListProvider> filteredPlaylists = usersProvider
        .filteredPlaylists; // Get the filtered playlist from the provider
    return Scaffold(
      backgroundColor: Color(0xFF1C1C27),
      body: Container(
        padding: EdgeInsets.only(
          top: 40,
          left: 19,
          right: 19,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Color(0xFFD2AFFF),
                    size: 33,
                  ),
                ),
                Text(
                  'Cari Playlist',
                  style: TextStyle(
                    color: Color(0xFFD2AFFF),
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: 33,
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            formCari(),
            SizedBox(
              height: 18,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredPlaylists.length,
                itemBuilder: (context, index) {
                  return PlaylistSearchResult(
                      iniDaftarPlaylist: filteredPlaylists[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget formCari() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: ShapeDecoration(
        color: Color(0xFF313142),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: TextField(
        style: TextStyle(color: Color(0xFFD2AFFF)),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(4),
          prefixIcon: Icon(
            Icons.search,
            color: Color(0xFFD2AFFF),
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Color(0xFFD2AFFF),
          ),
        ),
        onChanged: (value) {
          setState(() {
            searchString = value;
            context
                .read<UsersProvider>()
                .searchPlaylist(searchString: searchString);
          });
        },
      ),
    );
  }
}

class PlaylistSearchResult extends StatelessWidget {
  final PlayListProvider iniDaftarPlaylist;
  const PlaylistSearchResult({Key? key, required this.iniDaftarPlaylist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Navigate to the playlist screen
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return playlist1(
                iniDaftarPlaylist: iniDaftarPlaylist,
                listPlayList: context.watch<UsersProvider>(),
                currIdx: 0,
              );
            }));
          },
          child: Container(
            child: Row(
              children: [
                ClipRRect(
                  child: Image.file(
                    File(iniDaftarPlaylist.image),
                    width: 85,
                    height: 85,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                SizedBox(
                  width: 19,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      iniDaftarPlaylist.name,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFD2AFFF),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      iniDaftarPlaylist.desc,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFD2AFFF),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 12,
        )
      ],
    );
  }
}
