import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social/create/createVideo.dart';
import 'package:social/provider/providers.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        home: CreateVideo(),
      ),
    );
  }
}
