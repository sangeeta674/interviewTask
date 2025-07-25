import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social/camera/customCameraScreen.dart';
import 'package:social/player/videoPlayerScreen.dart';

class CreateVideo extends StatefulWidget {
  const CreateVideo({super.key});

  @override
  State<CreateVideo> createState() => _CreateVideoState();
}

class _CreateVideoState extends State<CreateVideo> {
  File? audioFile;
  File? _videoFile;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
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
      // getIt<ConfigRouter>().push(
      //   VideoPlayerRouter(videoFile: _videoFile),
      // );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VideoPlayerScreen(videoFile: _videoFile),
        ),
      );
    }
  }


  
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Select Video'),
        
      ),
      body: Center(
       
        child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      MaterialButton(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.white),
        ),
        onPressed: _pickVideo,
        color: Colors.black,
        child: Text(
          'Pick Video From Gallery',
          style: TextStyle(color: Colors.white),
        ),
      ),
      SizedBox(height: 16), // spacing between buttons
      MaterialButton(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.white),
        ),
        onPressed: _recordVideoFromCamera, // define this function
        color: Colors.black,
        child: Text(
          'Open Camera for Recording',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ],
        ),
      )
      
    );
  }
  Future<void> _recordVideoFromCamera() async {
  final pickedFile = await ImagePicker().pickVideo(source: ImageSource.camera);
  if (pickedFile != null) {
    File videoFile = File(pickedFile.path);
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => VideoPlayerScreen(videoFile: _videoFile),
      //   ),
      // );
      print(videoFile);
    // Use this file as needed, maybe navigate to the video player screen
  }
}
}
