import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:ffmpeg_kit_min_gpl/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_min_gpl/return_code.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:social/constants/constants.dart';
import 'package:social/models/songsListModel.dart';
import 'package:http/http.dart' as http;

class SongsListProvider with ChangeNotifier {
  SongsListProvider();

  bool _isFetching = false;
  bool get isFetching => _isFetching;

  List<SongsData> _songsData = [];
  List<SongsData> get songsData => _songsData;

  Future<void> fetchSongs() async {
    
    _isFetching = true;
    notifyListeners();

    try {
      final url = Uri.parse(Constants.baseURL + Constants.songsList);
      final response = await http.get(
        url,
        headers: {
          'unique-key': 'dev123',
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FkbWluLnNoZmxodWIuY29tL2FwaS9Vc2VyL1JlZ2lzdHJhdGlvbiIsImlhdCI6MTc1MzEyMTIyNCwibmJmIjoxNzUzMTIxMjI0LCJqdGkiOiJINDdDTVNOT2dkUTAyZVFVIiwic3ViIjoiMjM0IiwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.GVXbsrwrNqObpKKtZuqmZDxP6f8zyAH4FcI3FoJ6Qns',
          "Content-Type": "application/json",
        },
      );

      Constants.logger.w(response);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        _songsData = SongsListModel.fromJson(json).data!;
        Constants.logger.w(_songsData[0].soundList![0].sound!);
      }
    } catch (e) {
      Constants.logger.d('Error: $e');
    }

    _isFetching = false;
    notifyListeners();
  }

  Future<File> downloadSong(String url, String fileName) async {
    final dir = await getTemporaryDirectory();
    final filePath = '${dir.path}/$fileName.mp3';
    final response = await http.get(Uri.parse(url));
    final file = File(filePath);
    return await file.writeAsBytes(response.bodyBytes);
  }

  Future<String> mergeVideoWithAudio({
    required File videoFile,
    required File audioFile,
  }) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    Constants.logger.w(androidInfo.version.sdkInt.toString());

    if (androidInfo.version.sdkInt >= 33) {
      // Request permission
      final permission = await Permission.videos.request();
      if (!permission.isGranted) {
        throw Exception('Permission denied to access media storage');
      }
    } else {
      // Request permission
      final permission = await Permission.storage.request();
      if (!permission.isGranted) {
        throw Exception('Permission denied to access media storage');
      }
    }

    final status = await Permission.manageExternalStorage.request();

    if (!status.isGranted) {
      openAppSettings(); // Prompt user to enable manually
    }

    // Temporary output path
    final outputDir = '/storage/emulated/0/';
    final Directory dir = Directory('${outputDir}shReels');

    if (!(await dir.exists())) {
      await dir.create(recursive: true);
    }
    final outputPath =
        '${outputDir}shReels/merged_${DateTime.now().millisecondsSinceEpoch}.mp4';

    Constants.logger.w('OUTPUT PATH = ${outputDir}');

    // Merge command
    final command =
        '-i ${videoFile.path} -i ${audioFile.path} -c:v copy -c:a aac -strict experimental -map 0:v:0 -map 1:a:0 -shortest $outputPath';

    Constants.logger.w(command);

    final session = await FFmpegKit.execute(command);
    Constants.logger.w('Session = ${await session.getAllLogsAsString()}');
    final returnCode = await session.getReturnCode();
    Constants.logger.w('Return Code = ${returnCode}');

    if (ReturnCode.isSuccess(returnCode)) {
      final mergedFile = File(outputPath);

      // Save using image_gallery_saver_plus
      final Uint8List bytes = await mergedFile.readAsBytes();
      final result = await ImageGallerySaverPlus.saveFile(
        mergedFile.path,
        name: "shReels_${DateTime.now().millisecondsSinceEpoch}",
        isReturnPathOfIOS: true, // works on both Android & iOS
      );

      if (result['isSuccess'] == true || result['filePath'] != null) {
        print('✅ Video saved to gallery');
        return mergedFile.path;
      } else {
        throw Exception('Saving to gallery failed: $result');
      }
    } else {
      throw Exception('FFmpeg failed with code: $returnCode');
    }
  }
}
