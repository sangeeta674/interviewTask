import 'package:logger/logger.dart';

class Constants {
  Constants._();

  static const String appName = 'Social';

  /// API URL
  static const String baseURL = 'https://admin.shflhub.com';
  static const String songsList = '/api/Post/getSoundList';
static const String baseSongURL='https://d2znewqr33s1ud.cloudfront.net/shuffal/';

  /// Used to log errors and debugging.
  static var logger = Logger();
}
