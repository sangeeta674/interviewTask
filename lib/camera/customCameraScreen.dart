import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CustomCameraScreen extends StatefulWidget {
  @override
  _CustomCameraScreenState createState() => _CustomCameraScreenState();
}

class _CustomCameraScreenState extends State<CustomCameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  List<String> filters = ["Filter1", "Filter2", "Filter3", "Filter4"];
  int selectedFilterIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    _controller = CameraController(cameras[0], ResolutionPreset.high);
    _initializeControllerFuture = _controller.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _camerabg = Colors.white;

  @override
  Widget build(BuildContext context) {
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
                    child: CameraPreview(
                      _controller,
                    )),

                // Top bar with icons
                Positioned(
                  top: 40,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.settings, color: Colors.white),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.flash_off, color: Colors.white),
                        onPressed: () {},
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
                Positioned(
                  left: 20,
                  top: 150,
                  child: Column(
                    children: [
                      Icon(Icons.all_inclusive, color: Colors.white),
                      SizedBox(height: 20),
                      Icon(Icons.grid_on, color: Colors.white),
                      SizedBox(height: 20),
                      Icon(Icons.zoom_in, color: Colors.white),
                    ],
                  ),
                ),

                // Capture button and filter selection
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      // Filter slider
                      SizedBox(
                        height: 70,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: filters.length + 1,
                          itemBuilder: (context, index) {
                            int t = (filters.length + 1) ~/ 2;

                            return index == t
                                ? GestureDetector(
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
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      setState(
                                        () {
                                          selectedFilterIndex = index;
                                        },
                                      );

                                      // Constants.logger.w('message');
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      padding: EdgeInsets.all(0.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: selectedFilterIndex == index
                                              ? Colors.white
                                              : Colors.grey,
                                          width: 2,
                                        ),
                                      ),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "https://via.placeholder.com/50"), // Placeholder for filter preview
                                        radius: 25,
                                      ),
                                    ),
                                  );
                          },
                        ),
                      ),

                      // Bottom action buttons
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.photo_library, color: Colors.white),
                            GestureDetector(
                              onTap: () {
                                // Capture action
                              },
                              child: Container(
                                width: 200,
                                height: 30,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 51, 50, 50),
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10.0)),
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
}
