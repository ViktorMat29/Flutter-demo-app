import 'package:app/model/video.dart';

class VideosResultModel {
  var videos;

  VideosResultModel({this.videos});
  factory VideosResultModel.fromJson(Map<String, dynamic> json) {
    List<Video> tempVideos = <Video>[];
    if (json['results'] != null) {
      json['results'].forEach((video) {
        tempVideos.add(Video.fromJson(video));
      });
    }

    return VideosResultModel(videos: tempVideos);
  }
}
