import 'package:app/model/cast_model.dart';
import 'package:app/model/tv_show.dart';
import 'package:app/utils/tv_show_more_details_arguments.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/media_model.dart';

class TrendingTvShowWidget extends StatefulWidget {
  final String name;
  final String poster;
  final String posterWidth;

  const TrendingTvShowWidget(
      {Key? key,
      required this.name,
      required this.poster,
      required this.posterWidth})
      : super(key: key);

  @override
  State<TrendingTvShowWidget> createState() => _TrendingTvShowWidgetState();
}

class _TrendingTvShowWidgetState extends State<TrendingTvShowWidget> {
  @override
  Widget build(BuildContext context) {
    const String baseImageUrl = "https://image.tmdb.org/t/p/";
    TvShow tvShowArgs;
    return GestureDetector(
      onTap: () => {
        tvShowArgs = Provider.of<MediaModel>(context, listen: false)
            .trendingTvShows
            .where((movie) => movie.name == widget.name)
            .first,
        Navigator.pushNamed(
          context,
          'TvShowMoreDetails',
          arguments: TvShowMoreDetailsArguments(
              tvShowArgs.id,
              tvShowArgs.backgrounDrop,
              tvShowArgs.name,
              tvShowArgs.overview,
              tvShowArgs.posterPath,
              tvShowArgs.userRating,
              tvShowArgs.voteCount),
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
                style: const TextStyle(fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
