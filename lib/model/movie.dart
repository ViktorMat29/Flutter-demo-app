class Movie {
  final int id;
  final String backgrounDrop;
  final String name;
  final String overview;
  final String posterPath;
  final double userRating;
  final int voteCount;

  Movie({
    required this.id,
    required this.backgrounDrop,
    required this.posterPath,
    required this.name,
    required this.userRating,
    required this.voteCount,
    required this.overview,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json['id'],
        backgrounDrop: json['backdrop_path'],
        posterPath: json['poster_path'],
        name: json['title'],
        userRating: json['vote_average'],
        voteCount: json['vote_count'],
        overview: json['overview']);
  }
}
