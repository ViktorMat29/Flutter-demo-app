import 'package:app/widgets/media%20widgets/trending_movie_backgorund_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/media_model.dart';

class HorizontalScrollMovieBackgorunds extends StatefulWidget {
  const HorizontalScrollMovieBackgorunds({Key? key}) : super(key: key);

  @override
  _HorizontalScrollMovieBackgorundsState createState() =>
      _HorizontalScrollMovieBackgorundsState();
}

class _HorizontalScrollMovieBackgorundsState
    extends State<HorizontalScrollMovieBackgorunds> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      child: ListView(
        physics: const PageScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: Provider.of<MediaModel>(context, listen: true)
            .trendingMoviesDay
            .map(
              (movie) => GestureDetector(
                child: TrendingMovieBackgorundWidget(
                  name: movie.name,
                  background: movie.backgrounDrop,
                  backgroundWidth: "w400",
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
