import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TrendingMovieBackgorundWidget extends StatefulWidget {
  final String name;
  final String background;
  final String backgroundWidth;
  const TrendingMovieBackgorundWidget(
      {Key? key,
      required this.name,
      required this.background,
      required this.backgroundWidth})
      : super(key: key);

  @override
  _TrendingMovieBackgorundWidgetState createState() =>
      _TrendingMovieBackgorundWidgetState();
}

class _TrendingMovieBackgorundWidgetState
    extends State<TrendingMovieBackgorundWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.01,
                right: MediaQuery.of(context).size.width * 0.01),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.98,
              child: Image.network(
                "https://image.tmdb.org/t/p/w400${widget.background}",
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
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
    );
  }
}
