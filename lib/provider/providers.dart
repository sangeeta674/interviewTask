import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'songsListProvider.dart';

class Providers {
  static List<SingleChildWidget> providers() => [
    ChangeNotifierProvider<SongsListProvider>(
      create: (_) => SongsListProvider(),
    ),
  ];
}
