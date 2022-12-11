import 'package:app/model/tv_show.dart';

class TvShowsResultModel {
  var tvshows;
  var page;

  TvShowsResultModel({this.page, this.tvshows});
  factory TvShowsResultModel.fromJson(Map<String, dynamic> json) {
    List<TvShow> tempTvShows = <TvShow>[];
    if (json['results'] != null) {
      json['results'].forEach((tvShow) {
        tempTvShows.add(TvShow.fromJson(tvShow));
      });
    }

    return TvShowsResultModel(tvshows: tempTvShows);
  }
}
