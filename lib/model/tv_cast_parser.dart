import 'package:app/model/tv_cast.dart';

class TvCastResultModel {
  var crew;
  var cast;

  TvCastResultModel({this.cast, this.crew});
  factory TvCastResultModel.fromJson(Map<String, dynamic> json) {
    List<TvCast> tempCast = <TvCast>[];
    if (json['cast'] != null) {
      json['cast'].forEach((cast) {
        tempCast.add(TvCast.fromJson(cast));
      });
    }

    return TvCastResultModel(cast: tempCast);
  }
}
