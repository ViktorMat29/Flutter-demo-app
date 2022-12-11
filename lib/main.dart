import 'package:app/model/media_model.dart';
import 'package:app/screens/home_page.dart';
import 'package:app/screens/movies.dart';
import 'package:app/screens/tv_shows.dart';
import 'package:app/screens/trending_media.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  var mediaModel = MediaModel();
  try {
    mediaModel.fetchTrendingMoviesWeek();
    mediaModel.fetchTrendingMoviesDay();
    mediaModel.fetchTrendingTvShowsWeek();
  } catch (_) {}
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => mediaModel),
      ],
      child: const MyApp(),
    ),
  );
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
