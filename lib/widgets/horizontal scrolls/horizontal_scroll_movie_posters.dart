import 'package:app/utils/movie_more_details_arguments.dart';
import 'package:app/widgets/media%20widgets/trending_movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/media_model.dart';

class HorizontalScrollMoviePosters extends StatefulWidget {
  const HorizontalScrollMoviePosters({Key? key}) : super(key: key);

  @override
  _HorizontalScrollMoviePostersState createState() =>
      _HorizontalScrollMoviePostersState();
}

class _HorizontalScrollMoviePostersState
    extends State<HorizontalScrollMoviePosters> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const PageScrollPhysics(),
        children: Provider.of<MediaModel>(context, listen: true)
            .trendingMoviesWeek
            .map((movie) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: TrendingMovieWidget(
                        name: movie.name,
                        poster: movie.posterPath,
                        posterWidth: "w200"),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
