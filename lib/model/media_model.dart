import 'package:flutter/cupertino.dart';
import 'package:app/NAL/movie_api.dart' as api;
import 'movie.dart';

class MediaModel extends ChangeNotifier {
  List<Movie> trendingMoviesWeek = [];
  List<Movie> trendingMoviesDay = [];
  Future fetchTrendingMoviesWeek() async {
    trendingMoviesWeek = (await api.fetchTrendingMovies("week", "movie"));
    notifyListeners();
    return;
  }

  Future fetchTrendingMoviesDay() async {
    trendingMoviesDay = (await api.fetchTrendingMovies("day", "movie"));
    notifyListeners();
    return;
  }
}
