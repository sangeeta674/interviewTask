import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:social/constants/constants.dart';
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
  TextEditingController _searchController = TextEditingController();
  bool _isPlaying = true;
  final FocusNode _focusNode = FocusNode();
  bool _hasFocus = false;
  bool isDownloadingSong = false;
  File? audioFile;
  late AudioPlayer audioPlayer;




  @override
  void initState() {
    super.initState();
    audioPlayer=AudioPlayer();
    Provider.of<SongsListProvider>(context,listen: false).fetchSongs();
    // Provider.of<SongProvider>(context, listen: false).getPlaylist();
    // Provider.of<SongProvider>(context, listen: false);
    if (widget.videoFile != null) {
      _controller = VideoPlayerController.file(File(widget.videoFile!.path))
        ..initialize().then(
          (_) {
            setState(() {
              _controller!.play();
              _controller!.setLooping(true);
            }); // Auto play video when initialized
          },
        );
      print(widget.videoFile!.path);
    }
    _focusNode.addListener(
      () {
        setState(() {
          _hasFocus = _focusNode.hasFocus;
        });
      },
    );
  }
   void startDownload(String soundURL,String songTitle) async {
    setState(() => isDownloadingSong = true);

    audioFile = await Provider.of<SongsListProvider>(context, listen: false)
        .downloadSong(
          soundURL,
          songTitle,
        );

    await audioPlayer.setFilePath(audioFile!.path);

    setState(() => isDownloadingSong = false);
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
            icon: Icon(
              color: Colors.white,
              Icons.my_library_music_outlined,
            ),
            onPressed: () {
              showCustomSongBottomSheet(
                  context, songsProvider);
              
             },
          ),
        ],
      ),
      body: Stack(children: [
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
      ]),
      floatingActionButton: MaterialButton(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1.0,
          ),
        ),
        onPressed: () {
          print(widget.videoFile);
           Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VideoPlayerScreen(videoFile: widget.videoFile),
        ),
      );
        },
        child: Text(
          'Next',
          style: TextStyle(
            fontSize: 18.0,
          ),
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
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          builder: (context, controller) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  // Title and Search Button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Songs',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // ListView with Songs
                  songList.isFetching?
                  CircularProgressIndicator():
                  Expanded(
                    child: ListView.builder(
                      controller: controller,
                      itemCount: songList.songsData[8].soundList!.length,
                      itemBuilder: (context, index) {
                        final song = songList.songsData[8].soundList![index];
                        return ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              Constants.baseSongURL+song.soundImage!,
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
                          trailing: IconButton(
                            icon: Icon(Icons.play_circle_outline,
                                color: Colors.white),
                            onPressed: ()  {
                               startDownload(Constants.baseSongURL+song.sound!, song.soundTitle!);
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
  }
 }
