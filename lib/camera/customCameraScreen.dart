import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:social/constants/constants.dart';
import 'package:social/player/videoPlayerScreen.dart';
import 'package:social/provider/songsListProvider.dart';

class CustomCameraScreen extends StatefulWidget {
  @override
  _CustomCameraScreenState createState() => _CustomCameraScreenState();
}

class _CustomCameraScreenState extends State<CustomCameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  File? _videoFile;
  final picker = ImagePicker();
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
    _initializeCamera();
    audioPlayer = AudioPlayer();
    Provider.of<SongsListProvider>(context, listen: false).fetchSongs();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    _controller = CameraController(cameras[0], ResolutionPreset.high);
    _initializeControllerFuture = _controller.initialize();
    setState(() {});
  }

  Future<File?> pickVideo() async {
    final picked = await picker.pickVideo(source: ImageSource.gallery);
    return picked != null ? File(picked.path) : null;
  }

  Future<void> _pickVideo() async {
    File? video = await pickVideo();
    setState(() {
      _videoFile = video;
    });

    if (_videoFile != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VideoPlayerScreen(videoFile: _videoFile),
        ),
      );
    }
  }

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
    _controller.dispose();
    super.dispose();
  }

  Color _camerabg = Colors.white;

  @override
  Widget build(BuildContext context) {
    final songsProvider = Provider.of<SongsListProvider>(context);
    final mq = MediaQuery.of(context);
    final width = mq.size.width;
    final height = mq.size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                // Camera Preview
                Container(
                  width: width,
                  height: height * .9,
                  child: CameraPreview(_controller),
                ),

                // Top bar with icons
                Positioned(
                  top: 40,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.library_music_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          showCustomSongBottomSheet(context, songsProvider);
                        },
                      ),

                      IconButton(
                        icon: Icon(Icons.close, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),

                // Side icons for camera features

                // Capture button and filter selection
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      // Filter slider
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          GestureDetector(
                            onLongPress: () {
                              setState(() {
                                _camerabg = Colors.pink;
                              });
                            },
                            onLongPressUp: () {
                              setState(() {
                                _camerabg = Colors.white;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 4.0,
                                ),
                              ),
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: _camerabg,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.black,
                                  size: 25.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Bottom action buttons
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              color: Colors.white,
                              onPressed: () => _pickVideo(),
                              icon: Icon(Icons.photo_library),
                              iconSize: 34.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                Constants.logger.w('pick video');
                                _pickVideo();
                                // Capture action
                              },
                              child: Container(
                                width: 200,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 51, 50, 50),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            Icon(Icons.cameraswitch, color: Colors.white),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
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
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
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
                                itemCount:
                                    songList.songsData[8].soundList!.length,
                                itemBuilder: (context, index) {
                                  final song =
                                      songList.songsData[8].soundList![index];
                                  return ListTile(
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        Constants.baseSongURL +
                                            song.soundImage!,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                            ),
                                          )
                                        : !downloadedFiles.containsKey(index)
                                        ? IconButton(
                                            icon: Icon(
                                              Icons.save_alt_outlined,
                                              color: Colors.white,
                                            ),
                                            onPressed: () async {
                                              setModalState(
                                                () => downloadingIndex = index,
                                              );
                                              final file = await startDownload(
                                                Constants.baseSongURL +
                                                    song.sound!,
                                                song.soundId!.toString(),
                                              );
                                              downloadedFiles[index] = file;
                                              audioFile =
                                                  file; // Set selected audio
                                              _audioPlayer.setFilePath(
                                                file.path,
                                              );
                                              setModalState(
                                                () => downloadingIndex = null,
                                              );
                                            },
                                          )
                                        : IconButton(
                                            icon: Icon(
                                              playingIndex == index
                                                  ? Icons.pause
                                                  : Icons.play_arrow,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              if (playingIndex == index) {
                                                _audioPlayer.pause();
                                                setModalState(
                                                  () => playingIndex = null,
                                                );
                                              } else {
                                                _audioPlayer.play();
                                                setModalState(
                                                  () => playingIndex = index,
                                                );
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
