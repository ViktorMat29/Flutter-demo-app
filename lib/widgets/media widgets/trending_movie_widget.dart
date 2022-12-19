import 'dart:ui';

import 'package:app/model/media_model.dart';
import 'package:app/utils/movie_more_details_arguments.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';

import '../../model/movie.dart';

class TrendingMovieWidget extends StatefulWidget {
  final String name;
  final String poster;
  final String posterWidth;
  const TrendingMovieWidget(
      {Key? key,
      required this.name,
      required this.poster,
      required this.posterWidth})
      : super(key: key);

  @override
  _TrendingMovieWidgetState createState() => _TrendingMovieWidgetState();
}

class _TrendingMovieWidgetState extends State<TrendingMovieWidget> {
  final String baseImageUrl = "https://image.tmdb.org/t/p/";

  @override
  Widget build(BuildContext context) {
    Movie movieArgs;
    return GestureDetector(
      onTap: () => {
        movieArgs = Provider.of<MediaModel>(context, listen: false)
            .trendingMoviesWeek
            .where((movie) => movie.name == widget.name)
            .first,
        Navigator.pushNamed(
          context,
          'MovieMoreDetails',
          arguments: MovieMoreDetailsArguments(
              movieArgs.backgrounDrop,
              movieArgs.name,
              movieArgs.overview,
              movieArgs.posterPath,
              movieArgs.userRating,
              movieArgs.voteCount),
        ),
      },
      child: SizedBox(
        width: 150,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Image.network(
                baseImageUrl + widget.posterWidth + widget.poster,
                scale: 1,
              ),
            ),
            Center(
              child: AutoSizeText(
                widget.name,
                minFontSize: 12,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
