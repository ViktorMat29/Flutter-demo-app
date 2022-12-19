import 'package:app/model/tv_cast.dart';
import 'package:app/model/tv_show.dart';
import 'package:app/model/video.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/NAL/movie_api.dart' as api;
import 'movie.dart';

class MediaModel extends ChangeNotifier {
  List<Movie> trendingMoviesWeek = [];
  List<Movie> trendingMoviesDay = [];
  List<TvShow> trendingTvShows = [];
  List<Video> trailerLink = [];
  Future fetchTrendingMoviesWeek() async {
    trendingMoviesWeek = (await api.fetchTrendingMovies("week", "movie"));
    notifyListeners();
    return;
  }

  Future fetchTrendingTvShowsWeek() async {
    trendingTvShows = (await api.fetchTrendingTvShows("week", "tv"));
    notifyListeners();
    return;
  }

  Future fetchTrendingMoviesDay() async {
    trendingMoviesDay = (await api.fetchTrendingMovies("day", "movie"));
    notifyListeners();
    return;
  }

  Future fetchTrailerLink(int id, String mediaType) async {
    trailerLink = await api.fetchTrailerLink(id, mediaType);
    notifyListeners();
    return;
  }
}
