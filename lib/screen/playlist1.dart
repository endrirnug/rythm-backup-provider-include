import 'package:rythm/model/User.dart';
import 'package:rythm/providers/userProvider.dart';
import '../providers/playlistProvider.dart';
import 'package:rythm/providers/songProvider.dart';
import '../screen/listPlaylist.dart';
import '../screen/Play.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import '../screen/songListToAdd.dart';
import 'package:provider/provider.dart';
import '../screen/popupScreen.dart';

class playlist1 extends StatefulWidget {
  final PlayListProvider iniDaftarPlaylist;
  final UsersProvider listPlayList;
  final int currIdx;
  const playlist1(
      {Key? key,
      required this.iniDaftarPlaylist,
      required this.listPlayList,
      required this.currIdx})
      : super(key: key);

  @override
  State<playlist1> createState() => _playlist1State();
}

class _playlist1State extends State<playlist1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C27),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 37, vertical: 40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                "Playlist",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFD2AFFF),
                ),
              ),
              SizedBox(
                width: 28,
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ClipRRect(
                    child: Image.file(
                      File(widget.iniDaftarPlaylist.image),
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ]),
              ),
              SizedBox(
                height: 33,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.iniDaftarPlaylist.name,
                        style: TextStyle(
                          color: Color(0xFFD2AFFF),
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      Text(
                        widget.iniDaftarPlaylist.desc,
                        style: TextStyle(
                          color: Color(0xFFD2AFFF),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w100,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                      onTap: () {
                        if (widget.iniDaftarPlaylist.songList.length > 0) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Play(
                                listSong: widget.iniDaftarPlaylist.songList,
                                song: widget.iniDaftarPlaylist.songList[0],
                                currIndex: 0);
                          }));
                        } else if (widget.iniDaftarPlaylist.songList.length ==
                            0) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return popUpWarning(
                                  errorMessage: "Playlist ini kosong");
                            },
                          );
                        }
                      },
                      child: Icon(Icons.play_circle_fill_rounded,
                          color: Color(0xFFD2AFFF), size: 70)),
                ],
              )
            ],
          ),
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return songListToAdd(playlist: widget.iniDaftarPlaylist);
                }));
              },
              child: Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Icon(Icons.add_box_outlined,
                      color: Color(0xFFD2AFFF), size: 60),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Add Song",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFD2AFFF),
                    ),
                  )
                ]),
              )),
          Expanded(
            child: ListView.builder(
              itemCount: context
                  .watch<UsersProvider>()
                  .playListArr[widget.currIdx]
                  .songList
                  .length,
              itemBuilder: ((context, index) {
                if (index <=
                    context
                        .watch<UsersProvider>()
                        .playListArr[widget.currIdx]
                        .songList
                        .length) {
                  return songListinPlaylist(
                    iniDaftarPlaylist: widget.iniDaftarPlaylist,
                    currIdx: index,
                    listPlayList: context.watch<UsersProvider>(),
                  );
                }
              }),
            ),
          ),
        ]),
      ),
    );
  }
}

class songListinPlaylist extends StatelessWidget {
  final PlayListProvider iniDaftarPlaylist;
  final UsersProvider listPlayList;
  final int currIdx;
  const songListinPlaylist(
      {Key? key,
      required this.iniDaftarPlaylist,
      required this.currIdx,
      required this.listPlayList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Play(
                      listSong: iniDaftarPlaylist.songList,
                      song: iniDaftarPlaylist.songList[currIdx],
                      currIndex: currIdx,
                    );
                  }));
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          iniDaftarPlaylist.songList[currIdx].image,
                          height: 60,
                          width: 60,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      SizedBox(
                        width: 11.81,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            iniDaftarPlaylist.songList[currIdx].title,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFD2AFFF),
                            ),
                          ),
                          Text(
                            iniDaftarPlaylist.songList[currIdx].artist,
                            style: TextStyle(
                              fontSize: 10,
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
              Icon(Icons.more_vert_rounded, color: Color(0xFFD2AFFF), size: 30),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
