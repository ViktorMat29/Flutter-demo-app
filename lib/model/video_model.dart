import 'package:app/model/video.dart';
import 'package:flutter/material.dart';
import 'package:app/NAL/movie_api.dart' as api;

class VideoModel extends ChangeNotifier {
  List<Video> trailerLink = [];
  Future fetchTrailerLink(int id, String mediaType) async {
    trailerLink = await api.fetchTrailerLink(id, mediaType);
    notifyListeners();
    return;
  }
}
