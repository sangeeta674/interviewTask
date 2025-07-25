import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:social/constants/constants.dart';
import 'package:social/provider/songsListProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? audioFile;
  File? videoFile;
  late AudioPlayer audioPlayer;
  bool isDownloadingSong = false;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void startDownload() async {
    setState(() => isDownloadingSong = true);

    audioFile = await Provider.of<SongsListProvider>(context, listen: false)
        .downloadSong(
          'https://d2znewqr33s1ud.cloudfront.net/shuffal/1734723962Wild_Moves.mp3',
          'wild_moves',
        );

    await audioPlayer.setFilePath(audioFile!.path);

    setState(() => isDownloadingSong = false);
  }

  final picker = ImagePicker();

  Future<File?> pickVideo() async {
    final picked = await picker.pickVideo(source: ImageSource.gallery);
    return picked != null ? File(picked.path) : null;
  }

  @override
  Widget build(BuildContext context) {
    final songsProvider = Provider.of<SongsListProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            MaterialButton(
              onPressed: () => songsProvider.fetchSongs(),
              color: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(10.0),
              ),
              child: Text(
                'Get Songs',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 14.0),
              ),
            ),
            isDownloadingSong
                ? CircularProgressIndicator()
                : audioFile == null
                ? MaterialButton(
                    onPressed: () => startDownload(),
                    color: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10.0),
                    ),
                    child: Text(
                      'Download Song',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Now Playing',
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.play_arrow),
                            onPressed: () => audioPlayer.play(),
                          ),
                          IconButton(
                            icon: Icon(Icons.pause),
                            onPressed: () => audioPlayer.pause(),
                          ),
                          IconButton(
                            icon: Icon(Icons.stop),
                            onPressed: () => audioPlayer.stop(),
                          ),
                        ],
                      ),
                    ],
                  ),
            MaterialButton(
              onPressed: () async {
                videoFile = await pickVideo();
                Constants.logger.w(videoFile!.path);
              },
              color: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(10.0),
              ),
              child: Text(
                'Pick Video',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 14.0),
              ),
            ),
            MaterialButton(
              onPressed: () async {
                Constants.logger.w(videoFile!.path);
                Constants.logger.w(audioFile!.path);
                String code = await songsProvider.mergeVideoWithAudio(
                  videoFile: videoFile!,
                  audioFile: audioFile!,
                );
                Constants.logger.w(code.toString());
              },
              color: Colors.red[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(10.0),
              ),
              child: Text(
                'Merge Video',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 14.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
