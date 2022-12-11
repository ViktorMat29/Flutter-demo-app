class TvShow {
  final String backgrounDrop;
  final String name;
  final String overview;
  final String posterPath;
  final double userRating;
  final int voteCount;

  TvShow({
    required this.backgrounDrop,
    required this.posterPath,
    required this.name,
    required this.userRating,
    required this.voteCount,
    required this.overview,
  });

  factory TvShow.fromJson(Map<String, dynamic> json) {
    return TvShow(
        backgrounDrop: json['backdrop_path'],
        posterPath: json['poster_path'],
        name: json['name'],
        userRating: json['vote_average'],
        voteCount: json['vote_count'],
        overview: json['overview']);
  }
}
