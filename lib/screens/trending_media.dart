import 'package:app/model/media_model.dart';
import 'package:app/widgets/horizontal_scroll_movie_backgorunds.dart';
import 'package:app/widgets/horizontal_scroll_movie_posters.dart';
import 'package:app/widgets/horizontal_scroll_tv_show_posters.dart';
import 'package:app/widgets/trending_movie_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        child: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: AutoSizeText(
                "Hot movies today",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            HorizontalScrollMovieBackgorunds(),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0, top: 8.0),
              child: AutoSizeText(
                "Popular movies this week",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            HorizontalScrollMoviePosters(),
            AutoSizeText(
              "Popular TV shows this week",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            HorizontalScrollTvShowPosters(),
          ],
        ),
      ),
    );
  }
}
