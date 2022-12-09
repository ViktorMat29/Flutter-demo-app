import 'package:flutter/cupertino.dart';

class TvShows extends StatefulWidget {
  const TvShows({Key? key}) : super(key: key);

  @override
  _TvShowsState createState() => _TvShowsState();
}

class _TvShowsState extends State<TvShows> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Tv shows"),
      ),
    );
  }
}
