import 'package:logger/logger.dart';

class Constants {
  Constants._();

  static const String appName = 'Social';

  /// API URL
  static const String baseURL = 'https://admin.shflhub.com';
  static const String songsList = '/api/Post/getSoundList';

  /// Used to log errors and debugging.
  static var logger = Logger();
}
