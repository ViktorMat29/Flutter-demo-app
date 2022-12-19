class Video {
  final String name;
  final String key;
  final String id;
  Video({required this.name, required this.key, required this.id});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      name: json['name'],
      key: json['key'],
      id: json['id'],
    );
  }
}
