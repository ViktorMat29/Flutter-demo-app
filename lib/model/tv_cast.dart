class TvCast {
  final bool adult;
  final int? gender;
  final int castId;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final String? profilePath;
  final String character;
  final String creditId;
  final int order;
  TvCast(
      {required this.adult,
      required this.gender,
      required this.castId,
      required this.knownForDepartment,
      required this.name,
      required this.originalName,
      required this.profilePath,
      required this.character,
      required this.creditId,
      required this.order});

  factory TvCast.fromJson(Map<String, dynamic> json) {
    return TvCast(
      adult: json['adult'],
      gender: json['gender'],
      castId: json['id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      profilePath: json['profile_path'],
      character: json['character'],
      creditId: json['credit_id'],
      order: json['order'],
    );
  }
}
