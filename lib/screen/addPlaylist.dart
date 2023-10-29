import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../providers/userProvider.dart';
import 'package:provider/provider.dart';
import '../screen/popupScreen.dart';

class addPlaylist extends StatefulWidget {
  const addPlaylist({super.key});

  @override
  State<addPlaylist> createState() => _addPlaylistState();
}

class _addPlaylistState extends State<addPlaylist> {
  final namePlaylist = TextEditingController();
  final descPlaylist = TextEditingController();
  File? selectedImage;

  Future<void> getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        selectedImage = File(image.path);
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C27),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 26, vertical: 51),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_rounded,
                      color: Color(0xFFD2AFFF), size: 33),
                ),
                Text(
                  'Buat Playlist',
                  style: TextStyle(
                    color: Color(0xFFD2AFFF),
                    fontSize: 20,
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
              height: 25,
            ),
            Text(
              'Nama Playlist',
              style: TextStyle(
                color: Color(0xFFD2AFFF),
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            formNamaPlaylist(),
            SizedBox(
              height: 20,
            ),
            Text(
              'Deskripsi Playlist',
              style: TextStyle(
                color: Color(0xFFD2AFFF),
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            formDescPlaylist(),
            SizedBox(
              height: 20,
            ),
            Text(
              'Cover Playlist',
              style: TextStyle(
                color: Color(0xFFD2AFFF),
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () {
                getImage();
              },
              child: selectedImage != null
                  ? Container(
                      width: double.infinity,
                      height:
                          337, // Tinggi diatur ke 0 agar tidak ada ruang tambahan
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.file(
                            selectedImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ))
                  : Container(
                      width: double.infinity,
                      height: 337,
                      padding: EdgeInsets.only(
                          top: 71, bottom: 93, left: 96, right: 96),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFD2AFFF)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.upload_rounded,
                              color: Color(0xFFD2AFFF), size: 105),
                          Container(
                              width: 160,
                              height: 49,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xFFD2AFFF),
                              ),
                              child: Center(
                                child: Text(
                                  'Upload Foto',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    if (namePlaylist.text.isEmpty ||
                        descPlaylist.text.isEmpty ||
                        selectedImage == null) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return popUpWarning(
                              errorMessage: "Harap Lengkapi Form Playlist!");
                        },
                      );
                    } else {
                      context.read<UsersProvider>().tambahPlaylistBaru(
                          namePlaylist: namePlaylist.text,
                          descPlaylist: descPlaylist.text,
                          selectedImage: selectedImage);
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                      width: 160,
                      height: 49,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFD2AFFF),
                      ),
                      child: Center(
                        child: Text(
                          'Buat Playlist',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget formNamaPlaylist() {
    return Container(
      decoration: ShapeDecoration(
        color: Color(0xFF313142),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: TextField(
        style: TextStyle(color: Color(0xFFD2AFFF)),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(4),
            hintText: 'Masukkan Nama Playlist',
            hintStyle: TextStyle(
              color: Color(0xFFD2AFFF).withOpacity(0.5),
            ),
            border: InputBorder.none),
        onChanged: (value) {
          setState(() {
            namePlaylist.text = value;
          });
        },
      ),
    );
  }

  Widget formDescPlaylist() {
    return Container(
      decoration: ShapeDecoration(
        color: Color(0xFF313142),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: TextField(
        style: TextStyle(color: Color(0xFFD2AFFF)),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(4),
            hintText: 'Masukkan Deskripsi Playlist',
            hintStyle: TextStyle(
              color: Color(0xFFD2AFFF).withOpacity(0.5),
            ),
            border: InputBorder.none),
        onChanged: (value) {
          setState(() {
            descPlaylist.text = value;
          });
        },
      ),
    );
  }
}
