import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:social/constants/constants.dart';
import 'package:social/player/margeVideoPlayer.dart';
import 'package:social/provider/songsListProvider.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final File? videoFile;

  VideoPlayerScreen({required this.videoFile});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController? _controller;
  bool _isPlaying = true;
  final FocusNode _focusNode = FocusNode();
  bool _hasFocus = false;
  bool isDownloadingSong = false;
  File? audioFile;
  late AudioPlayer audioPlayer;
  bool isPlaying = false;
  int? downloadingIndex;
  int? playingIndex;
  Map<int, File> downloadedFiles = {}; // key = index or song ID

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    Provider.of<SongsListProvider>(context, listen: false).fetchSongs();
    if (widget.videoFile != null) {
      _controller = VideoPlayerController.file(File(widget.videoFile!.path))
        ..initialize().then((_) {
          setState(() {
            _controller!.play();
            // _controller.setVolume(0.0);
            _controller!.setLooping(true);
          }); // Auto play video when initialized
        });
      print(widget.videoFile!.path);
    }
    _focusNode.addListener(() {
      setState(() {
        _hasFocus = _focusNode.hasFocus;
      });
    });
  }
  // Future<File> startDownload(String url, String title) async {
  //     setState(() => isDownloadingSong = true);

  //     audioFile = await Provider.of<SongsListProvider>(context, listen: false)
  //         .downloadSong(
  //           soundURL,
  //           songTitle,
  //         );

  //     await audioPlayer.setFilePath(audioFile!.path);

  //     setState(() => isDownloadingSong = false);
  //     return downloadedFiles;
  //   }
  Future<File> startDownload(String url, String title) async {
    setState(() => isDownloadingSong = true);

    File audioFile = await Provider.of<SongsListProvider>(
      context,
      listen: false,
    ).downloadSong(url, title); // Use url and title

    await audioPlayer.setFilePath(audioFile.path);

    setState(() => isDownloadingSong = false);
    return audioFile;
  }

  @override
  void dispose() {
    _controller?.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final songsProvider = Provider.of<SongsListProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        // title: Text(
        //   '',
        // ),
        actions: [
          IconButton(
            icon: Icon(color: Colors.white, Icons.my_library_music_outlined),
            onPressed: () {
              showCustomSongBottomSheet(context, songsProvider);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isPlaying ? _controller!.pause() : _controller!.play();
                _isPlaying = !_isPlaying;
              });
            },
            child: _controller != null && _controller!.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio,
                    child: VideoPlayer(_controller!),
                  )
                : CircularProgressIndicator(),
          ),
        ],
      ),

      // floatingActionButton: MaterialButton(
      //   shape: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(10.0),
      //     borderSide: BorderSide(
      //       color: Colors.blue,
      //       width: 1.0,
      //     ),
      //   ),
      //   onPressed: () {

      //     print(widget.videoFile);
      //      Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => VideoPlayerScreen(videoFile: widget.videoFile),
      //   ),
      // );
      //   },
      //   child: Text(
      //     'marge video',
      //     style: TextStyle(
      //       fontSize: 18.0,
      //     ),
      //   ),
      // ),
      floatingActionButton: MaterialButton(
        onPressed: () async {
          if (widget.videoFile == null || audioFile == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Please select a song first.")),
            );
            return;
          }

          Constants.logger.w('Video ==============> '+widget.videoFile!.path);
          Constants.logger.w('Audio ==============> '+audioFile!.path);

          final code = await songsProvider.mergeVideoWithAudio(
            videoFile: widget.videoFile!,
            audioFile: audioFile!,
          );

          File mergedFile = File(code);

          if (mergedFile.existsSync()) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MargeVideoPlayer(videoFile: mergedFile),
              ),
            );
          } else {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Merged file not found.")));
          }
        },
        color: Colors.red[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          'Merge Video',
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 14.0),
        ),
      ),
    );
  }

  void showCustomSongBottomSheet(
  BuildContext context,
  SongsListProvider songList,
) {
  final AudioPlayer _audioPlayer = AudioPlayer();

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setModalState) {
          return DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.4,
            maxChildSize: 0.9,
            builder: (context, controller) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(
                        child: Text(
                          'Songs',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    songList.isFetching
                        ? Center(child: CircularProgressIndicator())
                        : Expanded(
                            child: ListView.builder(
                              controller: controller,
                              itemCount: songList.songsData[8].soundList!.length,
                              itemBuilder: (context, index) {
                                final song = songList.songsData[8].soundList![index];
                                return ListTile(
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      Constants.baseSongURL + song.soundImage!,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  title: Text(
                                    song.soundTitle!,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        song.producers!,
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        song.duration!,
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  trailing: downloadingIndex == index
                                      ? SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: CircularProgressIndicator(strokeWidth: 2),
                                        )
                                      : !downloadedFiles.containsKey(index)
                                          ? IconButton(
                                              icon: Icon(Icons.save_alt_outlined, color: Colors.white),
                                              onPressed: () async {
                                                setModalState(() => downloadingIndex = index);
                                                final file = await startDownload(
                                                  Constants.baseSongURL + song.sound!,
                                                  song.soundId!.toString(),
                                                );
                                                downloadedFiles[index] = file;
                                                audioFile = file; // Set selected audio
                                                _audioPlayer.setFilePath(file.path);
                                                setModalState(() => downloadingIndex = null);
                                              },
                                            )
                                          : IconButton(
                                              icon: Icon(
                                                playingIndex == index ? Icons.pause : Icons.play_arrow,
                                                color: Colors.white,
                                              ),
                                              onPressed: () {
                                                if (playingIndex == index) {
                                                  _audioPlayer.pause();
                                                  setModalState(() => playingIndex = null);
                                                } else {
                                                  _audioPlayer.play();
                                                  setModalState(() => playingIndex = index);
                                                }
                                              },
                                            ),
                                            
                                );
                              },
                            ),
                          ),
                  ],
                ),
              );
            },
          );
        },
      );
    },
  );

  }
}
