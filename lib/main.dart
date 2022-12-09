import 'package:app/screens/home_page.dart';
import 'package:app/screens/movies.dart';
import 'package:app/screens/tv_shows.dart';
import 'package:app/screens/welcome_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        'TvShows': (context) => const TvShows(),
        'Movies': (context) => const Movies(),
        'WelcomePage': (context) => const WelcomePage(),
      },
    );
  }
}
