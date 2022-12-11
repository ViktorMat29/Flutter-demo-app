import 'package:app/widgets/trending_movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/media_model.dart';

class HorizontalScrollTvShowPosters extends StatefulWidget {
  const HorizontalScrollTvShowPosters({Key? key}) : super(key: key);

  @override
  _HorizontalScrollTvShowPostersState createState() =>
      _HorizontalScrollTvShowPostersState();
}

class _HorizontalScrollTvShowPostersState
    extends State<HorizontalScrollTvShowPosters> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const PageScrollPhysics(),
        children: Provider.of<MediaModel>(context, listen: true)
            .trendingTvShows
            .map((movie) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TrendingMovieWidget(
                      name: movie.name,
                      poster: movie.posterPath,
                      posterWidth: "w200"),
                ))
            .toList(),
      ),
    );
  }
}
