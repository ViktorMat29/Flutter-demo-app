import 'dart:convert';
import 'package:app/model/tv_cast.dart';
import 'package:app/model/tv_cast_parser.dart';
import 'package:http/http.dart' as http;

const String apiKey = "0198cc5184a156374284903d73e22b6e";

Future<List<TvCast>> fetchCastForTvShow(int id) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/tv/$id/credits?api_key=$apiKey&language=en-US'));
  // Use the compute function to run parsePhotos in a separate isolate.
  if (response.statusCode == 200) {
    final responseBody = json.decode(response.body);
    final tvCast = TvCastResultModel.fromJson(responseBody).cast;
    return tvCast;
  } else {
    throw Exception(response.reasonPhrase);
  }
}
