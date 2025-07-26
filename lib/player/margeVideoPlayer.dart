import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MargeVideoPlayer extends StatefulWidget {
  final File? videoFile;

  MargeVideoPlayer({required this.videoFile});

  @override
  _MargeVideoPlayerState createState() => _MargeVideoPlayerState();
}

class _MargeVideoPlayerState extends State<MargeVideoPlayer> {
  VideoPlayerController? _controller;
  File? audioFile;
  bool isPlaying=false;
  bool _isPlaying=false;




  @override
  void initState() {
    super.initState();
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
   
  }
  

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        // title: Text(
        //   '',
        // ),
        
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
      
    );
  }

}