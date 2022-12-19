import 'dart:convert';
import 'package:app/model/tv_show.dart';
import 'package:app/model/video.dart';
import 'package:app/model/video_parser.dart';
import 'package:http/http.dart' as http;

import '../model/movie.dart';
import '../model/movie_parser.dart';
import '../model/tv_show_parser.dart';

const String apiKey = "0198cc5184a156374284903d73e22b6e";

// List<TvShow> parseTvShows(String responseBody) {
//   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
//   return parsed.map<TvShow>((json) => TvShow.fromJson(json)).toList();
// }

Future<List<Movie>> fetchTrendingMovies(
    String duration, String mediaType) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/trending/$mediaType/$duration?api_key=$apiKey'));
  // Use the compute function to run parsePhotos in a separate isolate.
  if (response.statusCode == 200) {
    final responseBody = json.decode(response.body);
    final movies = MoviesResultModel.fromJson(responseBody).movies;
    return movies;
  } else {
    throw Exception(response.reasonPhrase);
  }
}

Future<List<TvShow>> fetchTrendingTvShows(
    String duration, String mediaType) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/trending/$mediaType/$duration?api_key=$apiKey'));
  // Use the compute function to run parsePhotos in a separate isolate.
  if (response.statusCode == 200) {
    final responseBody = json.decode(response.body);
    final tvShows = TvShowsResultModel.fromJson(responseBody).tvshows;
    return tvShows;
  } else {
    throw Exception(response.reasonPhrase);
  }
}

Future<List<Video>> fetchTrailerLink(int id, String mediaType) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/$mediaType/$id/videos?api_key=$apiKey'));
  // Use the compute function to run parsePhotos in a separate isolate.
  if (response.statusCode == 200) {
    final responseBody = json.decode(response.body);
    final videos = VideosResultModel.fromJson(responseBody).videos;
    return videos;
  } else {
    throw Exception(response.reasonPhrase);
  }
}
