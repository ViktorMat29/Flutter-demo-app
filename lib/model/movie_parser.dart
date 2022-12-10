import 'movie.dart';

class MoviesResultModel {
  var movies;
  var page;

  MoviesResultModel({this.page, this.movies});
  factory MoviesResultModel.fromJson(Map<String, dynamic> json) {
    List<Movie> tempMovies = <Movie>[];
    if (json['results'] != null) {
      json['results'].forEach((movie) {
        tempMovies.add(Movie.fromJson(movie));
      });
    }

    return MoviesResultModel(movies: tempMovies);
  }
}
