import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/movie.dart';
import '../model/movie_parser.dart';

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
