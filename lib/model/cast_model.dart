import 'package:app/model/tv_cast.dart';
import 'package:app/NAL/cast_api.dart' as api;
import 'package:flutter/cupertino.dart';

class CastModel extends ChangeNotifier {
  List<TvCast> tvCast = [];
  Future fetchTvCastMembers(int id) async {
    tvCast = (await api.fetchCastForTvShow(id));
    notifyListeners();
    return;
  }
}
