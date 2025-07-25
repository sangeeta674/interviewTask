import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social/provider/providers.dart';

import '../home/home.dart';

class ConfigApp extends StatelessWidget {
  const ConfigApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.providers(),
      child: MaterialApp(
        title: 'Social',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        ),
        home: HomePage(),
      ),
    );
  }
}
